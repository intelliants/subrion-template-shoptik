<div class="b-cart">
	<a href="#" class="dropdown-toggle b-cart__toggle" data-toggle="dropdown" id="js-cart-shortcut">
		<svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" width="32px" height="32px" viewBox="0 0 32 32" style="enable-background:new 0 0 32 32;" xml:space="preserve">
			<path d="M27.996,8.91C27.949,8.395,27.519,8,27,8h-5V6c0-3.309-2.69-6-6-6c-3.309,0-6,2.691-6,6v2H5
						C4.482,8,4.051,8.395,4.004,8.91l-2,22c-0.025,0.279,0.068,0.557,0.258,0.764C2.451,31.882,2.719,32,3,32h26
						c0.281,0,0.549-0.118,0.738-0.326c0.188-0.207,0.283-0.484,0.258-0.764L27.996,8.91z M12,6c0-2.206,1.795-4,4-4s4,1.794,4,4v2h-8
						V6z M4.096,30l1.817-20H10v2.277C9.404,12.624,9,13.262,9,14c0,1.104,0.896,2,2,2s2-0.896,2-2c0-0.738-0.404-1.376-1-1.723V10h8
						v2.277c-0.596,0.347-1,0.984-1,1.723c0,1.104,0.896,2,2,2c1.104,0,2-0.896,2-2c0-0.738-0.403-1.376-1-1.723V10h4.087l1.817,20
						H4.096z"/>
		</svg>
		<span class="b-cart__toggle__count js-cart-placeholder-count" title="{lang key='products_count'}">{$commerce.cart.count}</span>
		<span class="b-cart__toggle__sum"><span class="js-cart-placeholder-total">{$commerce.cart.total}</span> {$core.config.currency} <span class="fa fa-angle-down"></span></span>
	</a>
	<div class="dropdown-menu pull-right b-cart__menu" id="js-cart-contents">
		{if $commerce.cart.count}
			<ul class="unstyled">
				{foreach $commerce.cart.items as $entry}
				<li>
					<span class="label label-info">{$entry.quantity}x</span>
					{ia_url item=$commerce.itemName type='link' data=$entry text=$entry.title}
					{if $entry.variation}<br><small>{$entry.variation|escape:'html'}</small>{/if}
					<small class="muted pull-right">{$entry.price}</small>
				</li>
				{/foreach}
				{if count($commerce.cart.items) > 3}
				<li>
					{lang key='plus_more_items' count=count($commerce.cart.items)-count($items)}
				</li>
				{/if}
			</ul>
			<p><strong>
				<a href="{$commerce.url.cart}">
				{lang key='go_to_shopping_cart'} <i class="icon-chevron-right"></i></a>
				</strong>
			</p>
			<hr>
			<div class="text-right">
				<a class="btn btn-danger btn-small" href="{$commerce.url.checkout}"><i class="icon-ok"></i> {lang key='checkout'}</a>
			</div>
		{else}
			<div class="b-cart__menu__empty">
				<span class="fa fa-hand-peace-o"></span>
				{lang key='cart_is_empty'}
			</div>
		{/if}
	</div>
</div>

{*
<div class="btn-group">
	<button id="js-cart-shortcut" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" tabindex="0">
		<i class="fa-shopping-cart" style="font-size: 1.3em; margin-right: 10px"></i>
		<span class="js-cart-placeholder-count">{lang key='products_count' count=$commerce.cart.count}</span> <span class="caret"></span>
		<span class="badge" style="margin-left: 7px"><span class="js-cart-placeholder-total">{$commerce.cart.total}</span> {$core.config.currency}</span>
	</button>
	<div id="js-cart-contents" class="dropdown-menu">
		{if $commerce.cart.count}
			<ul class="unstyled">
				{foreach $commerce.cart.items as $entry}
				<li>
					<span class="label label-info">{$entry.quantity}x</span>
					{ia_url item=$commerce.itemName type='link' data=$entry text=$entry.title}
					{if $entry.variation}<br><small>{$entry.variation|escape:'html'}</small>{/if}
					<small class="muted pull-right">{$entry.price}</small>
				</li>
				{/foreach}
				{if count($commerce.cart.items) > 3}
				<li>
					{lang key='plus_more_items' count=count($commerce.cart.items)-count($items)}
				</li>
				{/if}
			</ul>
			<p><strong>
				<a href="{$commerce.url.cart}">
				{lang key='go_to_shopping_cart'} <i class="icon-chevron-right"></i></a>
				</strong>
			</p>
			<hr>
			<div class="text-right">
				<a class="btn btn-danger btn-small" href="{$commerce.url.checkout}"><i class="icon-ok"></i> {lang key='checkout'}</a>
			</div>
		{else}
			<small class="muted">{lang key='cart_is_empty'}</small>
		{/if}
	</div>
</div>
*}