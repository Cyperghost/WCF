<dl>
	<dt><label for="{$variableName}">{lang}wcf.acp.style.variable.{$variableName}{/lang}</label></dt>
	<dd>
		<input type="number" name="{$variableName}" id="{$variableName}" value="{$variableValue}">
		<select name="{$variableName}_unit" id="{$variableName}_unit">
			<option value="%"{if $variableUnit == '%'} selected="selected"{/if}>%</option>
			<option value="em"{if $variableUnit == 'em'} selected="selected"{/if}>em</option>
			<option value="pt"{if $variableUnit == 'pt'} selected="selected"{/if}>pt</option>
			<option value="px"{if $variableUnit == 'px'} selected="selected"{/if}>px</option>
		</select>
	</dd>
</dl>