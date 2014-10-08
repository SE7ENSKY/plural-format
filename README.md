plural-format
=============

## Examples
```js
var value = 1
var formats = {
	zero: 'no items here',
	other: '{0} items'
}
var formattedValue = pluralFormat(value, formats)
```

or

```html
<div class="catalog-shortcard__added-counter"
	data-plural-format-zero="нет в корзине"
	data-plural-format-one="{0} блюдо добавлено"
	data-plural-format-few="{0} блюда добавлено"
	data-plural-format-many="{0} блюд добавлено">
</div>
```

```js
var dishesAdded = 3 # or whatever
$(".catalog-shortcard__added-counter").pluralFormat(dishesAdded) // formats are read from elements attributes
```
or
```js
var dishesAdded = 3 # or whatever
$(".dishes-in-cart").pluralFormat(dishesAdded, {
	zero: "нет в корзине",
	one: "{0} блюдо добавлено",
	few: "{0} блюда добавлено",
	many: "{0} блюд добавлено"
})
```
or
```js
$(".plural-format").pluralFormat() // auto-read values and formats from elements attributes
```
