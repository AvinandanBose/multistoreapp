# multistoreapp

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

<h1> Regular Expression To Validate Email  </h1>
 
 ```Syntax

Reg Exp :


UserName's Part
------------------------
r → Start of Expression
^ → Start of string 
' '  → String  enclosure(Also can proceed with " ")
$ → End of Expression(String)
So, 1st we will check : r'^[exp] +$' where exp→ Expression
[a-zA-Z0-9] → Will check between a to z ,A to Z and 0 to 9 if it finds returns 
 true (Valid Expression) i.e. r'^[a-zA-Z0-9] +$'

[\-\_\.] → \ stands for ' At End of A String' , it will then finds its match 
at end of a String with -(Hyphen) _ (Underscore) .(period) 
i.e.  Eg: good. or good_ or good-

Now:

[a-zA-Z0-9]+[\-\_\.][a-zA-Z0-9] : Eg→ AviBose_100 where + stand for 'Matches one or more'

* → It can occur Zero times to N number of times
Which makes a part optional , Now an email can be : BoseAvi_100 or BoseAvi Only before @ 

Hence we can do is:

[\-\_\.]* → -,_,. are now Optional
Also,
[a-zA-Z0-9]*  → Makes a-z,A-Z,0-9 optional

Now,

DoMain Name 's part
--------------------------

i.e. It can be gmail / outlook/ ymail etc. and it cannot be less than 2 Hence.
[a-zA-Z]{2,} → i.e It must be 2 i.e. Start with 2 character.

Extension's Part
-------------------

Now Domain Name always ends with [.] and its not Optional.

[a-zA-Z]{2,}+[\.]

Extensions are : .in , .com etc. i.e. Starts with 2 character and Not more than 3.

Hence : 
[\.][a-zA-Z]{2,3}

Now Full Expression we get:

RegExp(r'^[a-zA-Z0-9]+[\-\_\.]*[a-zA-Z0-9]*[@]+[a-zA-Z0-9]{2,}+[\.][a-zA-Z]{2,3}+$')

Now, the expression will throw error .

To overcome the error we have to priortize the parts:

([a-zA-Z0-9]+[\-\_\.]*[a-zA-Z0-9]*[@]+[a-zA-Z0-9]{2,}) - 1st Part When finished 
 then it looks for : [\.][a-zA-Z]{2,3}

Hence again Whole Expression must be closed with another Brace.

Final(1): RegExp(r'^(([a-zA-Z0-9]+[\-\_\.]*[a-zA-Z0-9]*[@]+[a-zA-Z0-9]{2,})+[\.][a-zA-Z]{2,3})+$')

Note: We can also use here ? instead of * 

? → zero or one (optional)

Final(2): RegExp(r'^(([a-zA-Z0-9]+[\-\_\.]?[a-zA-Z0-9]?[@]+[a-zA-Z0-9]{2,})+[\.][a-zA-Z]{2,3})+$')
```
