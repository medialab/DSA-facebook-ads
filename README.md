# DSA Ads data

## data source and documentation:

https://github.com/Lejo1/facebook_ad_library


## data conversion and preparation:

 - install bsondump

```bash
wget https://fastdl.mongodb.org/tools/db/mongodb-database-tools-amazon2-x86_64-100.10.0.tgz
tar -xzvf mongodb-database-tools-amazon2-x86_64-100.10.0.tgz
export PATH="$(pwd)/mongodb-database-tools-amazon2-x86_64-100.10.0/bin:$PATH"
```

- convert bson.gz files to json

```bash
zcat ads.bson.gz | bsondump -vvvvv --type=json | gzip > ads.json.gz
```

- analyze keys structure of the json

```bash
python analyze_data_structure.py ads.json.gz
```

- convert json to csv

```bash
python convert_json_to_csv.py ads.json.gz | gzip > ads.csv.gz
```

