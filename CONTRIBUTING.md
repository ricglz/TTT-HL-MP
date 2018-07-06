
# Contributing guideline

## Changes on ruby files
To keep the code maintainable. When you contribute with ruby files, make your that you run `rubocop` and that it gives you the less amount of errors posible.

## Style for scss files

```scss
/*Bad*/
foo{
	height: 50px;
}
foo .f {
	height: 50px;
	width: 30px;
}
/*Good*/
foo {
	height:50px;
	&.f {
		width: 30px;
	}
}

```
## Changes on slim and scss files
To keep this files clean, you most keep every code page as small posible. In case that you are editing this files with an editor in fullscreen, make sure that to see all the code you don't have to scroll the page.
If that's the case for
* **Slim** files you could create partials and render them
* **Style** files you can split the style in more files and import them.
