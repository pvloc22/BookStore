const express = require('express');
const router = express.Router();
const homeControllers = require('../../app/controllers/client/HomeControllers')

router.get('/filterGenre/:slug',homeControllers.getFilterGenre)
router.get('/genre',homeControllers.getGenre)
router.post('/search',homeControllers.searchPost)
router.get('/logout', homeControllers.homeLogout)
router.get('/:slug/:token', homeControllers.check_token,homeControllers.show)
router.post('/:slug', homeControllers.InsertFavoriteBook)
router.use('/:token', homeControllers.check_token,homeControllers.home)

module.exports = router
// 