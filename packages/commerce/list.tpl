<div class="card {if isset($class)}{$class}{/if}">
	{assign pictures $item.pictures|unserialize}
	<a href="{ia_url type='url' item='products' data=$item}" class="card__image">
		{printImage imgfile=$pictures[0]['path'] title=$item.title}
	</a>
	<div class="card__body">
		<div class="card__body__category">Category title</div>
		<div class="card__body__title">{ia_url item='products' type='link' data=$item text=$item.title}</div>
		<div class="card__body__actions">
			<div class="card__body__price">{$item.price|number_format} {$core.config.currency}</div>
			<button class="btn btn-sm btn-primary card__body__cart js-cmd-add-cart" data-id="{$item.id}">{lang key='add_to_cart'}</button>
		</div>
		<!-- <div class="card__body__snippet">{$item.snippet|truncate:50:'...':true}</div> -->
		{accountActions item=$item itemtype='products' classname='btn-info pull-left'}
	</div>
</div>