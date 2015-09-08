//
//  DbUtil.swift
//  needYouManage
//
//  Created by lvlinqing on 15/7/13.
//  Copyright (c) 2015年 needYouManage. All rights reserved.
//

import Foundation

let HABIT_TABLENAME = "habit"
//创建习惯表
let CREATE_HABIT_TABLE = "create table habit ( id integer primary key autoincrement ,typeName text )"
//创建习惯记录表
let CREATE_HABIT_NOTES = "create table habitNotes (id integer primary key autoincrement ,typeId integer,isSignIn integer,content text,createTime text)"

