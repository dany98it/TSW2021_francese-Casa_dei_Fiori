SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

--
-- Database: `sidaclic_casadeifiori`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `caratteristica`
--

CREATE TABLE `caratteristica` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `consegna`
--

CREATE TABLE `consegna` (
  `id` int(11) NOT NULL,
  `tipo` enum('standard','espressa') NOT NULL,
  `Corriere` varchar(100) NOT NULL,
  `data_consegna` date NOT NULL,
  `data_inizio_spedizione` date NOT NULL,
  `data_presunta_consegna` date NOT NULL,
  `stato` enum('ordinato','in elaborazione','spedito','in consegna','consegnato') NOT NULL,
  `indirizzo` int(11) NOT NULL,
  `ordine` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `contenuto`
--

CREATE TABLE `contenuto` (
  `ordine` int(11) NOT NULL,
  `Item` int(11) NOT NULL,
  `quantità` int(11) NOT NULL,
  `Iva Vendita` float NOT NULL,
  `PrezzoVendita` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `immagine`
--

CREATE TABLE `immagine` (
  `id` int(11) NOT NULL,
  `url` varchar(512) NOT NULL,
  `descrizione` tinytext
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `inclusione`
--

CREATE TABLE `inclusione` (
  `item` int(11) NOT NULL,
  `tag` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `indirizzo`
--

CREATE TABLE `indirizzo` (
  `id` int(11) NOT NULL,
  `provincia` varchar(100) NOT NULL,
  `citta` varchar(100) NOT NULL,
  `cap` varchar(10) NOT NULL,
  `via` varchar(256) NOT NULL,
  `interno` varchar(50) DEFAULT NULL,
  `numero_civico` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `item`
--

CREATE TABLE `item` (
  `id` int(11) NOT NULL,
  `iva` int(11) NOT NULL,
  `prezzo` decimal(10,0) NOT NULL,
  `descrizione` text NOT NULL,
  `nome` varchar(50) NOT NULL,
  `tipo` enum('piante','fiori veri','fiori finti','oggettistica') NOT NULL,
  `sconto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `mostra`
--

CREATE TABLE `mostra` (
  `item` int(11) NOT NULL,
  `immagine` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `ordine`
--

CREATE TABLE `ordine` (
  `id` int(11) NOT NULL,
  `tipo` enum('ritiro','consegna') NOT NULL,
  `tipo_di_pagamento` int(11) NOT NULL,
  `prezzo_totale` decimal(10,0) NOT NULL,
  `data` date NOT NULL,
  `user` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `possedere`
--

CREATE TABLE `possedere` (
  `item` int(11) NOT NULL,
  `cratterisitca` int(11) NOT NULL,
  `valore` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `recensione`
--

CREATE TABLE `recensione` (
  `user` varchar(256) NOT NULL,
  `item` int(11) NOT NULL,
  `titolo` varchar(256) NOT NULL,
  `commento` tinytext,
  `valutazione` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `tag`
--

CREATE TABLE `tag` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `descrizione` tinytext
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `user`
--

CREATE TABLE `user` (
  `email` varchar(256) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `cognome` varchar(100) NOT NULL,
  `data_di_nascita` date NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `permessi` enum('user','admin') NOT NULL,
  `password` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indici per le tabelle `caratteristica`
--
ALTER TABLE `caratteristica`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indici per le tabelle `consegna`
--
ALTER TABLE `consegna`
  ADD PRIMARY KEY (`id`),
  ADD KEY `indirizzo` (`indirizzo`),
  ADD KEY `ordine` (`ordine`);

--
-- Indici per le tabelle `contenuto`
--
ALTER TABLE `contenuto`
  ADD PRIMARY KEY (`Item`),
  ADD KEY `ordine` (`ordine`),
  ADD KEY `Item` (`Item`);

--
-- Indici per le tabelle `immagine`
--
ALTER TABLE `immagine`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indici per le tabelle `inclusione`
--
ALTER TABLE `inclusione`
  ADD PRIMARY KEY (`item`,`tag`),
  ADD KEY `item` (`item`),
  ADD KEY `tag` (`tag`);

--
-- Indici per le tabelle `indirizzo`
--
ALTER TABLE `indirizzo`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `mostra`
--
ALTER TABLE `mostra`
  ADD PRIMARY KEY (`item`,`immagine`),
  ADD UNIQUE KEY `item_UNIQUE` (`item`),
  ADD UNIQUE KEY `immagine_UNIQUE` (`immagine`);

--
-- Indici per le tabelle `ordine`
--
ALTER TABLE `ordine`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user` (`user`);

--
-- Indici per le tabelle `possedere`
--
ALTER TABLE `possedere`
  ADD PRIMARY KEY (`item`,`cratterisitca`),
  ADD KEY `caratteristica_idx` (`cratterisitca`);

--
-- Indici per le tabelle `recensione`
--
ALTER TABLE `recensione`
  ADD PRIMARY KEY (`user`,`item`),
  ADD KEY `item_idx` (`item`);

--
-- Indici per le tabelle `tag`
--
ALTER TABLE `tag`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indici per le tabelle `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`email`);


--
-- AUTO_INCREMENT per la tabella `caratteristica`
--
ALTER TABLE `caratteristica`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `immagine`
--
ALTER TABLE `immagine`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `indirizzo`
--
ALTER TABLE `indirizzo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `item`
--
ALTER TABLE `item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `ordine`
--
ALTER TABLE `ordine`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `tag`
--
ALTER TABLE `tag`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;


--
-- Limiti per la tabella `consegna`
--
ALTER TABLE `consegna`
  ADD CONSTRAINT `consegna_ibfk_1` FOREIGN KEY (`indirizzo`) REFERENCES `indirizzo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `consegna_ibfk_2` FOREIGN KEY (`ordine`) REFERENCES `ordine` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limiti per la tabella `contenuto`
--
ALTER TABLE `contenuto`
  ADD CONSTRAINT `contenuto_ibfk_1` FOREIGN KEY (`ordine`) REFERENCES `ordine` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `contenuto_ibfk_2` FOREIGN KEY (`Item`) REFERENCES `item` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limiti per la tabella `inclusione`
--
ALTER TABLE `inclusione`
  ADD CONSTRAINT `inclusione_ibfk_1` FOREIGN KEY (`tag`) REFERENCES `tag` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `inclusione_ibfk_2` FOREIGN KEY (`item`) REFERENCES `item` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limiti per la tabella `mostra`
--
ALTER TABLE `mostra`
  ADD CONSTRAINT `mostra_ibfk_1` FOREIGN KEY (`item`) REFERENCES `item` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `mostra_ibfk_2` FOREIGN KEY (`immagine`) REFERENCES `immagine` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limiti per la tabella `ordine`
--
ALTER TABLE `ordine`
  ADD CONSTRAINT `ordine_ibfk_1` FOREIGN KEY (`user`) REFERENCES `user` (`email`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limiti per la tabella `possedere`
--
ALTER TABLE `possedere`
  ADD CONSTRAINT `caratteristica` FOREIGN KEY (`cratterisitca`) REFERENCES `caratteristica` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `item` FOREIGN KEY (`item`) REFERENCES `item` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limiti per la tabella `recensione`
--
ALTER TABLE `recensione`
  ADD CONSTRAINT `recensione_ibfk_1` FOREIGN KEY (`user`) REFERENCES `user` (`email`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `recensione_ibfk_2` FOREIGN KEY (`item`) REFERENCES `item` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;
