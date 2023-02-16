require(dplyr)
require(stringr)
require(tidyr)
require(biomaRt)
require(argparse)


version <- '0.0.1'
parser <-
  ArgumentParser(description = 'Calculates statitics cw1')
parser$add_argument('-v',
                    '--version',
                    action = 'version',
                    version = paste(sub(".*=.*/", "", commandArgs()[4]), version))
parser$add_argument('--ensembl-version', type = 'integer', help = 'Ensembl version', default=109)
args <- parser$parse_args()

## get data from Ensembl
ensembl.human = useEnsembl(biomart = "ensembl",
                           dataset = "hsapiens_gene_ensembl",
                           version = args$ensembl_version)

homologs <-
  getBM(
    attributes = c(
      'ensembl_gene_id',
      'mmusculus_homolog_ensembl_gene',
      'mmusculus_homolog_orthology_type'
    ),
    filters = 'biotype',
    values = "protein_coding",
    mart = ensembl.human,
    useCache = FALSE
  )

human.domains <- getBM(
  attributes = c('ensembl_gene_id',
                 'pfam'),
  filters =
    'biotype',
  values = "protein_coding",
  mart = ensembl.human,
  useCache = FALSE
)

ensembl.mouse = useEnsembl(biomart = "ensembl",
                           dataset = "mmusculus_gene_ensembl",
                           version = args$ensembl_version)

mouse.domains <- getBM(
  attributes = c('ensembl_gene_id',
                 'pfam'),
  filters =
    'biotype',
  values = "protein_coding",
  mart = ensembl.mouse,
  useCache = FALSE
)

## filter biomat data
colnames(homologs) <- c("human.id", "mouse.id", "type")
one2one <-
  homologs %>% filter(type == "ortholog_one2one")
one2many <-
  homologs %>% filter(type == "ortholog_one2many")

colnames(mouse.domains) <- c("mouse.id", "pfam")
colnames(human.domains) <- c("human.id", "pfam")

one2one.full <- one2one %>%
  left_join(., mouse.domains, by = "mouse.id") %>%
  rename("mouse.pfam" = pfam) %>%
  left_join(., human.domains, by = "human.id") %>%
  rename("human.pfam" = pfam)

result.one2one <- one2one.full %>%
  group_by(human.id, mouse.id) %>%
  mutate("uniq.mouse" = if_else(mouse.pfam %in% human.pfam, "", as.character(mouse.pfam))) %>%
  mutate("uniq.human" = if_else(human.pfam %in% mouse.pfam, "", as.character(human.pfam))) %>%
  dplyr::select(human.id, mouse.id, uniq.human, uniq.mouse) %>%
  unique() %>% mutate(uniq.mouse = str_remove(str_remove(paste0(
    unique(uniq.mouse), collapse = ";"
  ), "^;"), ";$")) %>%
  mutate(uniq.human = str_remove(str_remove(paste0(
    unique(uniq.human), collapse = ";"
  ), "^;"), ";$")) %>%
  as.data.frame() %>%
  unique()

one2many.full <- one2many %>%
  left_join(., mouse.domains, by = "mouse.id") %>%
  rename("mouse.pfam" = pfam) %>%
  left_join(., human.domains, by = "human.id") %>%
  rename("human.pfam" = pfam)

result.one2many <- one2many.full %>%
  group_by(human.id, mouse.id) %>%
  mutate("uniq.mouse" = if_else(mouse.pfam %in% human.pfam, "", as.character(mouse.pfam))) %>%
  mutate("uniq.human" = if_else(human.pfam %in% mouse.pfam, "", as.character(human.pfam))) %>%
  dplyr::select(human.id, mouse.id, uniq.human, uniq.mouse) %>%
  unique() %>% mutate(uniq.mouse = str_remove(str_remove(paste0(
    unique(uniq.mouse), collapse = ";"
  ), "^;"), ";$")) %>%
  mutate(uniq.human = str_remove(str_remove(paste0(
    unique(uniq.human), collapse = ";"
  ), "^;"), ";$")) %>%
  as.data.frame() %>%
  unique()

n.pairs <- nrow(result.one2one) #15867

uniq.human.count <- result.one2one %>%
  filter(str_detect(uniq.human, "PF")) %>%
  nrow() #781

uniq.human.domain.count <- result.one2one %>%
  dplyr::select(uniq.human) %>%
  separate_rows(uniq.human, sep = ";") %>%
  filter(str_detect(uniq.human, "PF")) %>%
  nrow() # 849


uniq.mouse.count <-  result.one2one %>%
  filter(str_detect(uniq.mouse, "PF")) %>%
  nrow() # 547

uniq.mouse.domain.count <- result.one2one %>%
  dplyr::select(uniq.mouse) %>%
  separate_rows(uniq.mouse, sep = ";") %>%
  filter(str_detect(uniq.mouse, "PF")) %>%
  nrow() # 581

n.pairs2 <- nrow(result.one2many) #2675

uniq.human.count2 <- result.one2many %>%
  filter(str_detect(uniq.human, "PF")) %>%
  nrow() #315

uniq.human.domain.count2 <- result.one2many %>%
  dplyr::select(uniq.human) %>%
  separate_rows(uniq.human, sep = ";") %>%
  filter(str_detect(uniq.human, "PF")) %>%
  nrow() # 396

uniq.mouse.count2 <- result.one2many %>%
  filter(str_detect(uniq.mouse, "PF")) %>%
  nrow() # 334

uniq.mouse.domain.count2 <- result.one2many %>%
  dplyr::select(uniq.mouse) %>%
  separate_rows(uniq.mouse, sep = ";") %>%
  filter(str_detect(uniq.mouse, "PF")) %>%
  nrow() # 450


chi2.df <-
  data.frame(cbind(
    c(
      uniq.human.count + uniq.mouse.count,
      2 * n.pairs - uniq.human.count + uniq.mouse.count
    ),
    c(
      uniq.human.count2 + uniq.mouse.count2,
      2 * n.pairs2 - uniq.human.count2 + uniq.mouse.count2
    )
  ))
colnames(chi2.df) <- c("one2one", "one2many")
rownames(chi2.df) <- c("uniq", "common")


print("fraction of proteins with new domain within one2one orthologs:")
(uniq.human.count + uniq.mouse.count) / (2 * n.pairs)

print("fraction of proteins with new domain within one2many orthologs:")
(uniq.human.count2 + uniq.mouse.count2) / (2 * n.pairs2)

chisq.test(chi2.df)
