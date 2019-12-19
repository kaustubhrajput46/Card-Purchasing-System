## DBMS Final Project

## Group Name: DBMS Knights

- **Manager** :

  >***Siddhartha Dimania***

- **Programmers** : 
 
  >***Kavit Mehta***

  >***Kaustubh Rajput***

  >***Indrajit Swami***

## How to run the code
1. Import the project in intellij IDE.
2. Create the system user with  
```src > main > resources > static > sqlFiles > createProjectUser.sql```
3. In mysql console, login with above created user.
4. execute the mysql file ```src > main > resources > static > sqlFiles > dbmsFinalProject.sql```
5. Above sql file will generated all required schema and insert required values into the tables; 
```(Application login username and password is also provided in insert query)```
5. Go to intellij Run tab and run the project. ```(It will start spring boot application on localhost 8087 port)```

## Points suggested in project presentation.
a. Dr. Miller suggested to mention hash library in the project.
```
Corrected: 
In the project we’re computing PBKDF2 hash of the given plaintext password.
(Mentioned on slide 18 - Sign Up View)

```
b. Dr. Miller suggested to mention the missing FDs in the project.
```
Corrected: 
We had two missing FDs related with one to one relation. 
(Mentioned on slide 5 - Functional Dependencies)

```
c. Dr. Miller suggested to mention about global key and loseless. 
```
Corrected: 
We properly mentioned how we can get other keys from global key and why it's loseless. 
(Mentioned on slide 10 - 5th Step of 3NF)
```