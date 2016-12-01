angular.module('myApp')
.factory('decisionfactory', function () {
    var data = {
        currage: 20,
        anualincome: 500000,
        monthlyexp: 20000,
        assetcost: 100000,
        assettime:1,
        vacationcost: 25000,
        vacationtime: 1,
        othercost: 5000,
        othertime: 1,
        retireage: 45,
        life: 70,
        city: false,
        stat: 'Married with Kids',
        goals: {},
        goalcount: 0,
        routes: [],
        routeval: '',
        noofchild: 1,
        childrensage: false,
        childrenseducation: false,
        childrensmarriage: false,
        hospital: 'A',
        illness: false,
        inflation: 7,
        investing: 2.5,
        stock: 2.5,
        knowledge: 2.5,
        risk: 2.5
    };
    return {
        getrisk: function () {
            return data.risk;
        },
        getknowledge: function () {
            return data.knowledge;
        },
        getstock: function () {
            return data.stock;
        },
        getinvesting: function () {
            return data.investing;
        },
        getlife: function () {
            return data.life;
        },
        getretireage: function () {
            return data.retireage;
        },
        getothertime: function () {
            return data.othertime;
        },
        getothercost: function () {
            return data.othercost;
        },
        getvacationcost: function () {
            return data.vacationcost;
        },
        getvacationtime: function () {
            return data.vacationtime;
        },
        getassetcost: function () {
            return data.assetcost;
        },
        getassettime: function () {
            return data.assettime;
        },
        getchildrensmarriage: function () {
            return data.childrensmarriage;
        },
        getchildrenseducation: function () {
            return data.childrenseducation;
        },
        getchildrensage: function () {
            return data.childrensage;
        },
        getinflation: function () {
            return data.inflation;
        },
        getillness: function () {
            return data.illness;
        },
        gethospital: function () {
            return data.hospital;
        },
        getcurrage: function () {
            return data.currage;
        },
        getanualincome: function () {
            return data.anualincome;
        },
        getmonthlyexp: function () {
            return data.monthlyexp;
        },
        getcity: function () {
            return data.city;
        },
        getuserstatus: function () {
            return data.stat;
        },
        getgoals: function () {
            return data.goals;
        },
        getgoalcount: function () {
            return data.goalcount;
        },
        getroutes: function () {
            return data.routes;
        },
        getrouteval: function () {
            return data.routeval;
        },
        getnoofchild: function () {
            return data.noofchild;
        },
        setcurrage: function (age) {
            data.currage = age;
        },
        setanualincome: function (income) {
            data.anualincome = income;
        },
        setmonthlyexp: function (exp) {
            data.monthlyexp = exp;
        },
        setcity: function (ct) {
            data.city = ct;
        },
        setuserstatus: function (status) {
            data.stat = status;
        },
        setgoals: function (goal) {
            data.goals = goal;
        },
        setgoalcount: function (goalc) {
            data.goalcount = goalc;
        },
        setroutes: function (rot) {
            data.routes = rot;
        },
        setrouteval: function (val) {
            data.routeval = val;
        },
        setnoofchild: function (child) {
            data.noofchild = child;
        },
        sethospital: function (hospital) {
            data.hospital = hospital;
        },
        setillness: function (illness) {
            data.illness = illness;
        },
        setinflation: function (inflation) {
            data.inflation = inflation;
        },
        setchildrensage: function (childrensage) {
            data.childrensage = childrensage;
        },
        setchildrenseducation: function (childrenseducation) {
            data.childrenseducation = childrenseducation;
        },
        setchildrensmarriage: function (childrensmarriage) {
            data.childrensmarriage = childrensmarriage;
        },
        setassetcost: function (assetcost) {
            data.assetcost = assetcost;
        },
        setassettime: function (assettime) {
            data.assettime = assettime;
        },
        setvacationcost: function (vacationcost) {
            data.vacationcost = vacationcost;
        },
        setvacationtime: function (vacationtime) {
            data.vacationtime = vacationtime;
        },
        setothercost: function (othercost) {
            data.othercost = othercost;
        },
        setothertime: function (othertime) {
            data.othertime = othertime;
        },
        setlife: function (life) {
            data.life = life;
        },
        setretireage: function (retireage) {
            data.retireage = retireage;
        },
        setinvesting: function (investing) {
            data.investing = investing;
        },
        setstock: function (stock) {
            data.stock = stock;
        },
        setknowledge: function (knowledge) {
            data.knowledge = knowledge;
        },
        setrisk: function (risk) {
            data.risk = risk;
        }
    };

});