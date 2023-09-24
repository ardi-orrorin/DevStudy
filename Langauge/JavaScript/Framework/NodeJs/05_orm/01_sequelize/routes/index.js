const express = require('express');
const AlertSite = require('../models/alertSite');

const router = express.Router();

router.get('/', async (req, res, next) => {
    try{
        const alerts = await AlertSite.findAll({limit:10});
        res.json(alerts);
    }catch(err){
        console.error(err);
        next(err);
    }
});

router.post('/', async (req, res, next) => {
    try{
        console.log(req);
        const alerts = await AlertSite.create({
            siteName: req.body.siteName,
            siteTitle: req.body.siteTitle,
            siteUrl: req.body.siteUrl,
            siteDomain: req.body.siteDomain,
        })
        res.json(alerts);
    }catch(err){
        console.error(err);
        next(err);
    }
});

router.route('/:id')
    .get(async(req, res, next)=> {
        try{
            // const alerts = await AlertSite.findAll({where: {id: req.params.id}}); // 이렇게도 표현 가능
            const alerts = await AlertSite.findByPk(req.params.id); 
            res.json(alerts);
        }catch(err){
            console.error(err);
            next(err);
        }   
    })
    .delete(async(req, res, next) => {
        try{
            const result = await AlertSite.destroy({where: {id: req.params.id}})
            res.json(result);
        }catch(err){
            console.error(err);
            next(err);
        }
    })
    

module.exports = router