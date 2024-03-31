const express = require('express');
const router = express.Router();
const  historyControllers = require('../../app/controllers/client/HistoryControllers')

router.get('/:token', historyControllers.HistoryGet)

module.exports = router