# igrmkCV, yet another LaTeX CV/Résumé class

The class is loosely inspired by the [AltaCV](https://github.com/liantze/AltaCV) class, though it has
diverged so significantly that none of the original code remains.
It has been completely reworked to align with my standards for both
visual and code aesthetics. Most optional features and customization
points have been removed to simplify the code, as they added complexity
without fully meeting my needs. The result is a streamlined,
non-customizable class. If you require more flexibility, the best
approach would be to fork the project and develop your own version.
The following CV has been compiled from the [examples/igrmk-net.tex](examples/igrmk-net.tex) file.

![CV](https://github.com/igrmk/igrmkcv/releases/latest/download/example-igrmk-net.png)

## Build your own CV

1. Install Tectonic, along with Inter and FontAwesome fonts. For example, using Homebrew:
   ```bash
   brew install tectonic
   ```

2. Copy the `igrmkcv.cls` class to your CV directory, along with both files
   from one of the examples (e.g., `igrmk-net.tex` and `igrmk-net.xmpdata`). Rename
   them to, say, `john.doe.tex` and `john.doe.xmpdata`.

3. Customize both files according to your own experience.

4. Run the following command to compile the CV:

   ```bash
   tectonic john.doe.tex
   ```
