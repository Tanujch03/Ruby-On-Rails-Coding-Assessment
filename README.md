
# Ruby-On-Rails-Coding-Assessment

# README

Build a simple rails application that consists of a receptionist portal & doctor portal which performs the following tasks,
- A single login page for both portals.
- Receptionists can register a new patient & perform CRUD operations.
- Doctors can view registered patients & view the graph that represents the number of patients registered vs days.

```
rails new hospital_app -d postgresql
cd hospital_app
```

## Generate models

```
rails g model User email:string password_digest:string role:string
rails g model Patient name:string age:integer gender:string
```

```
rails g controller Users
rails g controller Sessions
rails g controller Patients
rails g controller Dashboard
```

## Run on local machine

```
rails server
```
