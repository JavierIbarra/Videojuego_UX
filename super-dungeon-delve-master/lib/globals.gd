extends Node

var player: KinematicBody2D
var map: TileMap
const GRID_SIZE = 16

var gold = 6000
var depth = 1
var final_boss = 3
var kills = 0
var skin = 0
var difficulty = 10
var weapons = {1: ["hammer", 0, true], 2: ["sword", 5000, false], 3: ["spear", 7000, false]}
var n_weapons = 1
var dead_boss = false
var mostrado = false
