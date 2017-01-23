{if $commerce.newlyAdded}
	<div class="cards -n4">
		{foreach $commerce.newlyAdded as $item}
			{include 'extra:commerce/list' itemName=$commerce.itemName}
		{/foreach}
	</div>
{/if}