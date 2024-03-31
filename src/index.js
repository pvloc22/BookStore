const path = require('path')
const express = require('express')
const morgan = require('morgan')
const handlebars = require('express-handlebars')
const app = express()
const route = require('./routes')
const session = require('express-session')
const port = 3000


const { createClient } = require('redis')
const RedisStore = require('connect-redis').default;
const redisClient = createClient()
redisClient.connect().catch(console.error)
const redisStore = new RedisStore({
    client: redisClient
})

app.use(session({
    secret: 'keyboard cat',
    store: redisStore,
    resave: false,
    saveUninitialized: false,
    cookie: {
        secure: false,
        httpOnly: true,
        maxAge: 60 * 60 * 1000,
    }
}))


app.use(express.static(path.join(__dirname, 'public')));
//HTTP Logger
app.use(morgan('combined'))
//template Engine
app.engine('hbs', handlebars.engine({ defaultLayout: 'main', extname: 'hbs' }));
app.set('view engine', 'hbs');
app.set('views', path.join(__dirname, 'resources/views'));
//add middleware
app.use(express.urlencoded())
app.use(express.json())


route(app)

app.listen(port, () => { console.log(`connect web with port ${port}`) })