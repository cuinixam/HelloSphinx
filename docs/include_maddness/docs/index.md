# Hi There!

This is the main page.

```{toctree}

a/index
```

## Include a file directly

This include will cause the `ROOT` and not the `B` image to be shown because the path of the image is relative to the current file.
When a file is included the current path is not changed, just the content of that file gets included.

```{attention}
There is no warning that the `images/images.png` file is not found because it finds the one in root.
```

```{include} b/index.md
```

## Include a file and use the `relative-images` attribute

This include will cause the `B` image to be shown because we can specify the `relative-images` attribute.

```{include} b/index.md
:relative-images:
```

## Include a file which includes other files

```{include} c/index.md
:relative-docs: c/
:relative-images:
```