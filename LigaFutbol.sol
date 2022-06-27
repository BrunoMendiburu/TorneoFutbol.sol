// SPDX-License-Identifier: MIT
pragma solidity ^0.8.14;

contract TorneoFutbol {
    mapping(string => string) jugadores__equipo;
    mapping(string => uint256) puntos__equipo;
    string[] private _jugadores;
        uint256[] private _puntos;
}

function addEquipo(string memory _equipo) public {
    jugadores__equipo[_equipo] = "";
    puntos__equipo[_equipo] = 0;
}

function addJugador (string memory _equipo, string memory _jugador) public {
    jugadores__equipo[_equipo] = ;
}

function addPuntos(string memory _equipo, uint256 _puntos) public {
    puntos__equipo[_equipo] = ;
}

function getPuntos(string memory _equipo) public view returns (uint256) {
    return puntos__equipo[_equipo];
}

function getJugadores(string memory _equipo) public view returns (string[]) {
    return jugadores__equipo[_equipo];
}