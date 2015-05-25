## Weaponised R

![weaponised R](http://www.quickmeme.com/img/b3/b3fe35940097bdc40a6d9f26ad06318741a0df1b982881524423046eb43a70e7.jpg)

Annoy your friends! Vex your coworkers! Confound your collaborators!

Step right up, useRs, for *jammr*, a package that weaponises a user's R session against them in barely 30 lines of code. When loaded, it:

1. Sets `T` to FALSE;
2. Sets `F` to TRUE;
3. Sets pi to exactly 3, and;
4. Disables the emitting of all warning, error or diagnostic messages, which should make working out what on earth is going on *great* fun.

Once loaded, you can then call `clean()` - the only exported function - which prints a ton of newlines to cover up your silliness, generates a facimilie of the R loading message, and then unloads `jammr`, allowing you to get away with it regardless of the presence of those meddling kids.

## Use

    devtools::install_github("ironholds/jammr")
    library(jammr)
    clean()

And then walk away giggling.
