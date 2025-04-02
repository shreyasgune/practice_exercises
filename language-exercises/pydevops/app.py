import os
import re 

def Hello(name="World"):
    print(f"Hello {name}")


def Looper():
    for i in range(10):
        print(i)

def Joiner():
    items = ["shreyas","gman","the G"]
    print(" and ".join(items))
    print(items)

def StrStuff():
    name = "shreyas gune"
    print(
        name.capitalize(),
        name.upper(),
        name.lower(),
        name.title(),
        name.swapcase(),
        name.lower()
    )
    print(f"{name} is a really decent person, innit.")

def MapStuff():
    map = {
        "key1": "value1",
        "key2": "value2",
        "key3": "value3",
    }
    for i,j in map.items():
        print(i,j)

def regexStuff():
    #common case to search for a stringtype
    somestr="My email is sgune@protonmail.com"
    regsearch = re.search(r'(?P<username>[A-Za-z]+)@(?P<domain>[A-Za-z]+)\.(?P<extension>[A-Za-z]+)',somestr)
    group = regsearch.group()
    print(group, f'{regsearch.group("username")}, belongs to {regsearch.group("domain")}, ending in {regsearch.group("extension")}')

    #Lets findall emails
    emails = """
        Here's a list of people who have signed up:
        sgune@protonmail.com
        shreyasgune@gmail.com
        someone_something@hotmail.com

        Hope your like the list.
    """

    emailsOnly = re.findall(r'(\w+)@(\w+)\.(\w+)', emails)
    print(emailsOnly)

    # some substitution stuff
    hero = "Son Goku"
    new_hero = re.sub("Son [A-Za-z]+","Gohan",hero)
    print(f'Original Hero was : {hero}, but the new hero is {new_hero}')

    #you can even use someVar = re.compile(r"PATTERN") and use someVar.search or someVar.match


def main():
    Hello("Shreyas")
    # Looper()
    # Joiner()
    # StrStuff()
    # MapStuff()
    regexStuff()




if __name__ == "__main__":
    main()
