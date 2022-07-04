// SPDX-License-Identifier: MIT
pragma solidity ^0.8.14;

contract Tournament {
    mapping(string => string[]) private jugadores__equipo;
    mapping(string => uint256[]) private puntos__equipo;

    function setAddJugadoresEquipo(string memory jugador_, string memory equipo_)
        public
    {
        jugadores__equipo[equipo_].push(jugador_);
    }

    function delJugadoresEquipo(string memory jugador_) public {
        for (uint256 i = 0; i < jugadores__equipo[jugador_].length; i++) {
            if (
                keccak256(abi.encodePacked(jugadores__equipo[jugador_][i])) ==
                keccak256(abi.encodePacked(jugador_))
            ) {
                delete jugadores__equipo[jugador_][i];
            }
        }
    }

    function addPuntosEquipo(
        string memory equipo1_,
        string memory equipo2_,
        uint256 _1goles,
        uint256 _2goles
    ) public {
        if (_1goles > _2goles) {
            puntos__equipo[equipo1_].push(3);
            puntos__equipo[equipo2_].push(0);
        } else if (_1goles < _2goles) {
            puntos__equipo[equipo1_].push(0);
            puntos__equipo[equipo2_].push(3);
        } else {
            puntos__equipo[equipo1_].push(1);
            puntos__equipo[equipo2_].push(1);
        }
    }

    function addPuntosEquipo(string memory _equipo)
        public view
        returns (uint256)
    {
        uint256 addPuntos = 0;
        for (uint256 i = 0; i < puntos__equipo[_equipo].length; i++) {
            addPuntos += puntos__equipo[_equipo][i];
        }
        return addPuntos;
    }

    function getJugadoresEquipo() public view returns (string[] memory) {
        string memory _equipo;
        string[] memory jugadores = new string[](
            jugadores__equipo[_equipo].length
        );
        for (uint256 i = 0; i < jugadores__equipo[_equipo].length; i++) {
            jugadores[i] = jugadores__equipo[_equipo][i];
        }
        return jugadores;
    }

    function equipoMasPuntos() public view returns (string memory) {
        uint256 mas_puntos = 0;
        string memory equipo_mas = "";
        string memory equipo_;
        for (uint256 i = 0; i < puntos__equipo[equipo_].length; i++) {
            if (addPuntosEquipo(equipo_) > mas_puntos) {
                mas_puntos = addPuntosEquipo(equipo_);
                equipo_mas = equipo_;
            }
        }
        return equipo_mas;
    }
}