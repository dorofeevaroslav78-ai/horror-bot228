const mineflayer = require('mineflayer');

// НАСТРОЙКИ - ИЗМЕНИ ПОД СВОЙ СЕРВЕР!
const config = {
    host: "xyi228.aternos.me",  // ← СЮДА АДРЕС ТВОЕГО СЕРВЕРА
    port: 37083,
    username: "HorrorBot",
    version: "1.20.4",
    auth: "offline"
};

const bot = mineflayer.createBot(config);

bot.on('spawn', () => {
    console.log('✅ Бот подключился к серверу!');
    bot.chat('👻 Хоррор-бот активирован!');
});

bot.on('playerJoined', (player) => {
    if (player.username !== bot.username) {
        bot.chat(`👁️ Я вижу тебя, ${player.username}...`);
    }
});

bot.on('end', () => {
    console.log('❌ Бот отключился, переподключение через 5 секунд...');
    setTimeout(() => createBot(), 5000);
});

bot.on('error', (err) => console.error('Ошибка:', err.message));
