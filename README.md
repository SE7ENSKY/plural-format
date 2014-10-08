plural-format
=============

## Example
```jade
<div class="catalog-shortcard__added-counter"
	data-plural-format-zero="нет в корзине"
	data-plural-format-one="{0} блюдо добавлено"
	data-plural-format-few="{0} блюда добавлено"
	data-plural-format-many="{0} блюд добавлено">
</div>
```

```coffee
dishesAdded = 3 # or whatever
$(".catalog-shortcard__added-counter").pluralFormat dishesAdded
```
