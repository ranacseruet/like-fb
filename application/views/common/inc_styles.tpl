<link type="text/css" rel="stylesheet" href="{$base_url}bower_components/bootstrap/dist/css/bootstrap.min.css" />
<!-- Bootstrap ends -->

<!-- Jquery UI CSS Files Starts -->
<link type="text/css" rel="stylesheet" href="{$base_url}bower_components/jquery-ui/themes/base/jquery-ui.css" />
<!-- Jquery UI CSS Files Ends -->

<!-- Main site layout and styles Starts -->
<link type="text/css" rel="stylesheet" href="{$base_url}styles/main/layout.css" />
<link type="text/css" rel="stylesheet" href="{$base_url}styles/main/styles.css" />
<!-- Main site layout and styles Ends -->

{assign var="style_file" value="styles/"|cat:$content|cat:".css"}

{if file_exists($style_file)}   
    <link type="text/css" rel="stylesheet" href="{$base_url}{$style_file}" />
{/if}
<link type="text/css" rel="stylesheet" href="{$base_url}styles/prettify.css" />