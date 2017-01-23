{if $items}
	{include 'extra:commerce/_sorting-header'}

	<div class="cards -h">
		{foreach $items as $item}
			{include 'extra:commerce/list' class="-h"}
		{/foreach}
	</div>

	{navigation aTotal=$pagination.total aTemplate=$pagination.url aItemsPerPage=$pagination.limit}
{elseif 'products_search' == $core.page}
	<div class="alert alert-info">{lang key='nothing_found'}</div>
{else}
	<div class="alert alert-info">{lang key='no_products'}</div>
{/if}