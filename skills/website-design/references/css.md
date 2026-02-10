# CSS 

## The power of relative units

Favor CSS "em" and "rem" over "px". Basically stop thinking in pixels for all things. Be more nuanced and think of each use case.

- Relatuve units can be used to specify sizes that adapr to the font size or viewport size.
- "em" define a length in terms of an element's font size, except when specifying font size itself, in which case ems are in terms of the element's inherited
font size.
- "rem" define a length in terms of the font size specified on the root "<html>" element.
- By scaling the root font size in a responsive design, elements on the page defined using ems and rems will scale at the same time.
- Viewport-relative units define a length in terms of the viewport's width or height.
- A line height define with a unitless number will inherit more predictably to child elements.

1. "em" can be convenient when setting propertoes like padding, height, width or border-radius because they scale evenly with the element
if it inherits different font sizes or if the user changes the font settings.
2. Use "rems" to define font-size property with setting a sane default font size for the ":root" element
