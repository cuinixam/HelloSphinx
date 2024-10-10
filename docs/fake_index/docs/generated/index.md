# I am generated

This is the generated page.

Before `toctree` directive.

```{toctree}

/generated/a/index.md
/user/a/index.md
```

After `toctree` directive.

## Include a simple file

```{include} /generated/b/index.md
:relative-docs: generated/b/
:relative-images:
```

## Include a file which includes other files

```{include} /generated/c/index.md
:relative-docs: generated/c/
:relative-images:
```