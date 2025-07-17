# Fetch driver:

This is a script used to fetch the canon's printer drivers from **mr.Halladj's** (VM)machine, it will use scp, to remotly and securly copy the compressed file, then it will go aheard and decompress it and the install it locally.


## how to use:

### clone the repository:
`git clone https://github.com/halladj/fetch_driver`


### make the script executable:
```
cd fetch_driver

chmod +x fetch_driver.sh
```

### Run the the script:
`./fetch_driver.sh misc 10.0.10.8 # example: machine @ed 10.0.10.8` 
