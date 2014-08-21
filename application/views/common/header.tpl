    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="{$base_url|cat:"images/logo.png"}"> 
                {if file_exists("./images/logo.png")}    
                <img width="160" height="28" alt="Demo.CodeSamplez.com" src="{$base_url}images/logo.png">
                {else}
                    <strong>Demo.CodeSamplez.com</strong>
                {/if}
            </a>
        </div>
        <div class="collapse navbar-collapse">
            <ul class="nav navbar-nav">
                <li><a href="{$base_url}">Home</a></li>
                <li><a href="{$base_url}contact">Contact</a></li>
                {if !$is_logged_in}
                <li><a href="{$base_url}login">Login</a></li>
                <li><a href="{$base_url}register">Register</a></li>
                {else}
                <li><a href="{$base_url}myaccount/logout">Logout</a></li>
                <li><a href="{$base_url}myaccount">Dashboard</a></li>
                {/if}            
            </ul>
        </div>
    </div>

            
            