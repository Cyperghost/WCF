{include file='__commentJavaScript' commentContainerID='pageCommentList'}

<ul id="pageCommentList" class="commentList containerList" data-can-add="{if $commentCanAdd}true{else}false{/if}" data-object-id="{@$pageID}" data-object-type-id="{@$commentObjectTypeID}" data-comments="{@$commentList->countObjects()}" data-last-comment-time="{@$lastCommentTime}">
	{if $commentCanAdd}{include file='commentListAddComment' wysiwygSelector='pageCommentListAddComment'}{/if}
	{include file='commentList'}
</ul>
