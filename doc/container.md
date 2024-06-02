# container.sh  
_Replace 'sudo docker' and/or 'sudo podman' with 'box' (less typing)_  

---  

### Aliases  
```
# Independent Functions
cl -> container-list: creates ${clist[2]} array of container ids and lists containers
cs -> container-search: returns containerIDs, takes a search-term
il -> image-list: creates ${ilist[@]} array of image ids and lists images
is -> image-search: returns imageIDs, takes a search-term

# Dependent Functions
bss => box-search-stop: takes a search-term, stops the first matching container
bse => box-search-enter: takes a search-term, runs 'docker exec -it' of 'bash' or [arg2] on the first matching container
```

## TODO finish documenting aliases and functions
