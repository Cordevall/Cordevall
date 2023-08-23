mod eventhandler;

use anyhow::anyhow;
use serenity::prelude::*;
use std::env;
use eventhandler::Bot;

#[main]
async fn serenity() -> Result<shuttle_serenity::ShuttleSerenity, Box<dyn std::error::Error>> {
    // Get the discord token set in the environment
    let token = env::var("DISCORD_TOKEN")
        .map_err(|_| anyhow!("'DISCORD_TOKEN' was not found"))?;

    // Set gateway intents, which decides what events the bot will be notified about
    let intents = GatewayIntents::GUILD_MESSAGES | GatewayIntents::MESSAGE_CONTENT;
    let client = Client::builder(&token, intents)
        .event_handler(Bot)
        .await
        .expect("Err creating client");

    Ok(client.into())
}
