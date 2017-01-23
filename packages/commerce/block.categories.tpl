{$categoryId = {(isset($core.page.info['commerce.category'])) ? $core.page.info['commerce.category'].id : null}}
<ul>
	{foreach $commerce.categories as $entry}
		<li{if $categoryId && ($categoryId == $entry.id || $core.page.info['commerce.category'].parent == $entry.id)} class="active"{/if}><a href="{$core.packages.commerce.url}{$entry.url}">{$entry.title|escape:'html'}{if $entry.subcategories}<span class="fa fa-angle-right"></span>{/if}</a>
			{if $entry.subcategories}
				<ul>
					{foreach $entry.subcategories as $subEntry}
						<li{if $categoryId == $subEntry.id} class="active"{/if}><a href="{$core.packages.commerce.url}{$subEntry.url}">{$subEntry.title|escape:'html'}</a></li>
					{/foreach}
				</ul>
			{/if}
		</li>
	{/foreach}
</ul>