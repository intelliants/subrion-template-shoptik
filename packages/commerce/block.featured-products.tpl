<div class="cards -n4">
	{foreach $commerce.featured as $item}
		{include 'extra:commerce/list' itemName=$commerce.itemName}
	{/foreach}
</div>