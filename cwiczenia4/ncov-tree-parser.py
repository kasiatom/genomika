import json
import argparse

names = {
        "country":         "node_attrs_country_value",
        "divergence":      "node_attrs_div",
        "location":        "node_attrs_location_value",
        "date":            "node_attrs_num_date_value",
        "sex":             "node_attrs_sex_value",
        "age":             "node_attrs_age_value",
        "mutations":       "branch_attrs_labels_aa",
        "clade":           "node_attrs_clade_membership_value"
        
        }


def get_keys_by_args(arg_name):
    return names[arg_name]   


def read_feature_arg(text):
    return text.split(",")


def get_full_key_name(prefix, feature_list):
    return [prefix + x for x in feature_list]


def prepare_all_keys(aa_key):
    aa_keys_final_list = []
    aa_key_list = aa_key.replace("_branch_attrs_labels_aa", "").split("_")
    for i in range(2,len(aa_key_list),2):
        new_key = "_".join(aa_key_list[0:i]) +"_branch_attrs_labels_aa"
        #print(new_key)
        aa_keys_final_list.append(new_key)
    return aa_keys_final_list


def safe_get_value(dictionary, one_key):
    if "branch_attrs_labels_aa" in one_key:
        
        v1 = ""
        for i in prepare_all_keys(one_key):
            try:
                v1 += "; " + dictionary[i]
            except KeyError:
                v1 += ""
        v = tidy_mutation_list(v1.strip(";").strip()) 
    else:
        try:
            v = str(dictionary[one_key])
        except KeyError:
            v = ""
    return v


def tidy_mutation_list(mutations):
    if mutations != "":
        messy_list = [i.split(": ") for i in mutations.split("; ")] 
        #print(messy_list)
        genes = set(sorted(([i[0] for i in messy_list])))
        nice_list = []
        for gene in genes:
            gene_mutations = ", ".join(["".join(i[1]) for i in messy_list if i[0] == gene ]).split(", ")
            #print(gene_mutations) 
            sorted_mutations = sorted(gene_mutations, key = lambda x: int(x[1:-1]))
            final_mutations = gene + ": " + ", ".join(sorted_mutations)
            nice_list.append(final_mutations)
        return "; ".join(nice_list)
    else:
        return ""


def flatten_json(y):
    out = {}

    def flatten(x, name=''):
        if type(x) is dict:
            for a in x:
                flatten(x[a], name + a + '_')
        elif type(x) is list:
            i = 0
            for a in x:
                flatten(a, name + str(i) + '_')
                i += 1
        else:
            out[name[:-1]] = x

    flatten(y)
    return out


def find_good_values(big_dict, features_list):
    out = []
    keys_list = []
    header = "ID\t"
    for feature in features_list:
        try:
            keys_list.append(get_keys_by_args(feature))
            header+=feature+"\t"
        except KeyError:
            print("Invalid feature value: "+feature+". Skipped")
            continue
    selected_keys = [item for item in big_dict.keys() if "gisaid_epi_isl_value" in item]
    selected_names = [name.replace("node_attrs_gisaid_epi_isl_value","") for name in selected_keys ]
    for i in selected_names:
        ID = [big_dict[i + "node_attrs_gisaid_epi_isl_value"]]
        new_keys = get_full_key_name(i, keys_list) ##tutaj
        items = ID + [safe_get_value(big_dict, i) for i in new_keys]
        out.append(items)
    return [out, header]


if __name__=='__main__':
   
    parser = argparse.ArgumentParser(description='This script flatten the tree part of the ncov json and returns needed node and branch attributes in tab format ')
    parser.add_argument('-i', '--input', type=str, help="Path to input ncov tree json; created with 'cat ncov_global.json | jq .tree' command")
    parser.add_argument('-f', '--features', type=str, help="Coma deliminated list of wanted attributes, \
                                                            for example 'age,mutations', 'clade,sex,date,divergence'. \
                                                            ................ Possible values: ....................\
                                                            country, location, date (output given as \
                                                            year.year_fraction),  \
                                                            sex, mutations (list of all protein level mutations), \
                                                            clade, age, divergence (virus sequence divergence, \
                                                            comparing to the initial Wuhan strais)")
                                           
    parser.add_argument('-o', '--output', type=str, help="Path to output tab file")
    args = parser.parse_args()

    t=open(args.input)
    ncov = json.load(t)
    t.close()
    wanted_features = read_feature_arg(args.features)
    flat_json = (flatten_json(ncov))
    data, header = find_good_values(flat_json, wanted_features)
    
    with open(args.output, 'w') as f:
        f.write(header+"\n")
        for item in data:
            new_item = "\t".join(item)+"\n"
            f.write(new_item) 


