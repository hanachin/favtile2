App.Templates.tweet = _.template """
<a href="/<%- user.screen_name %>">
  <img class="tweet-icon" src="<%- user.profile_image_url %>" alt="<%- user.screen_name %> icon" />
</a>
<a class="tweet-screen-name" href="/<%- user.screen_name %>"><%- user.screen_name %></a>
<p class="tweet-content"></p>
<footer class="tweet-footer">
  <div class="tweet-toolbar">
    <span class="tweet-toolbar-fav">
      <img class="tweet-unfav-btn" src="/assets/unfav-btn.png" alt="favorited" /><img class="tweet-fav-btn" src="/assets/fav-btn.png" alt="No favorite yet." /><span>fav</span>
    </span>
    |
    <span class="tweet-toolbar-retweet">
      <img class="tweet-unrt-btn" src='/assets/unrt-btn.png' alt='retweeted'/><img class="tweet-rt-btn" src='/assets/rt-btn.png' alt='No retweet yet.'/><span>rt</span>
    </span>
    |
    <span class="tweet-toolbar-user">
      <a href="http://twitter.com/<%- user.screen_name %>" target="_blank">
        <img src="/assets/user.png" alt="Jump to twitter user page" />
        <span>user</span>
      </a>
    </span>
    |
    <a href="http://twitter.com/<%- user.screen_name %>/status/<%- id_str %>">... </a>
  </div>
</footer>
"""
