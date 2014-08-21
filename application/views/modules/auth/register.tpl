<div id="content">
</br>
    <div class="span-24 last" id="error"></div>
        <form action="{$action_url}" method="post" class="well">
            <div>
                <label class="control-label" for="username">Username</label><br />
                <input type="text" name="username" value="" id="username" size="30" class="required"  />
            </div>
            <div>
                <label class="control-label" for="password">Password</label><br />
                <input type="password" name="password" value="" id="password" size="30"  class="required"  />
            </div>
            <div>
                <label class="control-label" for="confirm_password">Confirm Password</label><br />
                <input type="password" name="confirm_password" value="" id="confirm_password" size="30"  class="required"  />
            </div>
            <div>
                <label class="control-label" for="email">Email Address</label><br />
                <input type="text" name="email" value="" id="email" maxlength="80" size="30"  class="required email"  />
            </div>
            <div>
                <input type="submit" name="register" value="Register" class="btn"  />
            </div>
        </form>
    </div>
</div>