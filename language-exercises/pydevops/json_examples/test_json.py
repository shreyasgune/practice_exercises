import json
from pprint import pprint
import yaml

with open('test.json', 'r') as json_file:
    data = json.load(json_file)
    # pprint(data)

#Change the value of something
pprint(data["Statement"]["Effect"]) # this is allow
data["Statement"]["Effect"] = "Disallow"
pprint(data["Statement"]["Effect"])

# Write a new file with changed stuff
with open("updated_test.json", 'w') as newfile:
    json.dump(data, newfile, indent=4)
    pprint(newfile)

# YAML converion
with open('test.json', 'r') as json_file, open('test.yaml','w') as yaml_file :
    json_data = json.load(json_file)
    yaml.dump(json_data, yaml_file)
    