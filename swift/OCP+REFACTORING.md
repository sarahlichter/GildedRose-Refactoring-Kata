Open Closed Principle -
OCP says that classes should be open for extension but closed for modification. By implementing a protocol and multiple item types any additional item can be added to the Gilded Rose. If the new items are not special, they do not even need their own protocol conforming type to be added. However, in the event that the item does have special rules, the type can be added without having to change the Item class in any way. The only change that needs to be made in the GildedRose class is an additional case to the switch statement.

Approach:
1 - Add characterization tests.
    These tests are meant to enforce + document existing behavior. They provide a safety net while refactoring. I know that if I fail a test, I have inadvertently changed behaivior.
2 - Make small syntax changes.
    The goal of these changes was simplify the code by making better use of what Swift makes available. These changes are mostly cosmetic.
3 - Extract Methods
    All behavior really lives in `GildedRose.adjustValues()`. This function includes many if statements, negative logic, and duplication. However, everything really comes down to three main chunks of work
            1 - update quality
            2 - update sellin
            3 - update quality again
        Because of these clear differences in behavior, I separated the single .adjustValues into three functions, one for each chunk of work. All the branching, duplication, and negative logic stays, but is pulled into the different functions.
4 - Establish protocol
    Creating a protocol enables the creation of different Item types that all implement their unique set of rules in a similar manner. The protocol requires one function that will operate on the item it takes in and adjust the values according to the specific type's rules. By taking an item into the function, we are able to leave the original Item class alone.
5 - Create classes that implement the protocol and move behavior
    `GildedRose.adjustValues()` now implements a switch method that compares the name of each item and directs it accordingly. This approach allowed me to address each case individually while leaving the rest of the cases alone, so that the transition was methodical and isolated. I started with the simplest case which addressed the innermost if statements and worked my way up the conditionals. While doing this, I also flipped logic to make it match in multiple places and easier to extract.
6 - Simmplify the logic in individual classes
    

Code Smells:
- Long method - addressed by extracting methods
- Duplicated Code - addressed by extracting methods and collapsing conditionals
- Inappropriate Intimacy - addressed by operating on the sellIn + quality values in their typed class rather than in `GildedRose()`
- Combinatorial Explosion - simplified logic, made negative conditionals positive, extracted conditions to their appropriate class, removed if statements from the inside and worked my out in order to remove the most specific thing first
- Primitive Obsession - worked to minimize the number of specific strings used in conditionals by pulling the strings into constants.
