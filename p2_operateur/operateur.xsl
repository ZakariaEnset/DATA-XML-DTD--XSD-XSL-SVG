<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"  version="2.0">
    <xsl:template match="/">
        <html>
            <head><title>Operateur</title></head>
            <body>
                <h1>Liste des clients</h1>
                <ul>
                <xsl:for-each select="operateur/client">
                    <li>Nom du client: <xsl:value-of select="@nom"/></li>
                    <table border="1" width="90%">
                        <thead>
                            <tr>
                                <td>Num abonnement</td>
                                <td>Type</td>
                                <td>Date abonnement</td>
                                <td>Montant Total des factures</td>
                            </tr>
                        </thead>
                        <tbody>
                            <xsl:for-each select="abonnement">
                                <tr>
                                    <td><xsl:value-of select="@numero"/></td>
                                    <td><xsl:value-of select="@type"/></td>
                                    <td><xsl:value-of select="@dateAb"/></td>
                                    <td><xsl:value-of select="sum(facture/@montant)"/></td>
                                 </tr>
                            </xsl:for-each>
                            <tr>
                                <td colspan="3">Nombre d'abonnement:</td>
                                <td><xsl:value-of select="count(abonnement)"/></td>
                            </tr>
                        </tbody>
                    </table>
                </xsl:for-each>
                 <li>Nombre de clients: <xsl:value-of select="count(operateur/client)"/> </li>
                 <li>Nombre d'abonnements: <xsl:value-of select="count(//abonnement)"/> </li>
                 <li>Total des factures <xsl:value-of select="sum(//facture/@montant)"/> </li>
                 <li>Total des factures non réglée: <xsl:value-of select="sum(//facture[@reglee='NON']/@montant)"/> </li>
                 <li>Moyennes des montants des factures: <xsl:value-of select="avg(//facture/@montant)"/> </li>  
                </ul>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>