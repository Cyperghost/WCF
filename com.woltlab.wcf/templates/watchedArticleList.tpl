{capture assign='headContent'}
	{if $pageNo < $pages}
		<link rel="next" href="{link controller='WatchedArticleList'}pageNo={@$pageNo+1}{/link}">
	{/if}
	{if $pageNo > 1}
		<link rel="prev" href="{link controller='WatchedArticleList'}{if $pageNo > 2}pageNo={@$pageNo-1}{/if}{/link}">
	{/if}
{/capture}

{capture assign='headerNavigation'}>
	{if ARTICLE_ENABLE_VISIT_TRACKING}
		<li class="jsOnly"><a href="#" title="{lang}wcf.article.markAllAsRead{/lang}" class="markAllAsReadButton jsTooltip"><span class="icon icon16 fa-check"></span> <span class="invisible">{lang}wcf.article.markAllAsRead{/lang}</span></a></li>
	{/if}
{/capture}

{capture assign='sidebarRight'}
	{if !$labelGroups|empty}
		<form id="sidebarForm" method="post" action="{link application='wcf' controller=$controllerName object=$controllerObject}{/link}">
			<section class="box">
				<h2 class="boxTitle">{lang}wcf.label.label{/lang}</h2>
				
				<div class="boxContent">
					<dl>
						{include file='__labelSelection'}
					</dl>
					<div class="formSubmit">
						<input type="submit" value="{lang}wcf.global.button.submit{/lang}" accesskey="s">
					</div>
				</div>
			</section>
		</form>
		
		<script data-relocate="true">
			$(function() {
				WCF.Language.addObject({
					'wcf.label.none': '{lang}wcf.label.none{/lang}',
					'wcf.label.withoutSelection': '{lang}wcf.label.withoutSelection{/lang}'
				});
				
				new WCF.Label.Chooser({ {implode from=$labelIDs key=groupID item=labelID}{@$groupID}: {@$labelID}{/implode} }, '#sidebarForm', undefined, true);
			});
		</script>
	{/if}
{/capture}

{include file='header'}

{hascontent}
	<div class="paginationTop">
		{content}
			{pages print=true assign='pagesLinks' controller='WatchedArticleList' link="pageNo=%d"}
		{/content}
	</div>
{/hascontent}

{if $objects|count}
	<div class="section">
		{include file='articleListItems'}
	</div>
{else}
	<p class="info" role="status">{lang}wcf.global.noItems{/lang}</p>
{/if}

<footer class="contentFooter">
	{hascontent}
		<div class="paginationBottom">
			{content}{@$pagesLinks}{/content}
		</div>
	{/hascontent}
	
	{hascontent}
		<nav class="contentFooterNavigation">
			<ul>
				{content}{event name='contentFooterNavigation'}{/content}
			</ul>
		</nav>
	{/hascontent}
</footer>

{if ARTICLE_ENABLE_VISIT_TRACKING}
	<script data-relocate="true">
		require(['WoltLabSuite/Core/Ui/Article/MarkAllAsRead'], function(UiArticleMarkAllAsRead) {
			UiArticleMarkAllAsRead.init();
		});
	</script>
{/if}

{include file='footer'}
