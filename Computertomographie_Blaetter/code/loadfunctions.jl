module CT
    #using Pkg
    #Pkg.add("GenericSVD")
    #Pkg.add("JLD")
    #Pkg.add("LinearAlgebra")
    #Pkg.add("Plots")
    #Pkg.add("NLopt")
    #Pkg.add("Random")
    #Pkg.add("JuMP")
    #Pkg.add("Printf")
    #Pkg.add("FileIO")
    #Pkg.add("ImageMagick")
    #Pkg.add("Images")
    #Pkg.add("FixedPointNumbers")
    #Pkg.add("ImageDraw")
    using GenericSVD
    using JLD
    using LinearAlgebra
    using Plots
    using NLopt
    using Random
    using JuMP
    using Printf
    using FileIO
    using ImageMagick
    using Images
    using FixedPointNumbers
    using ImageDraw
    # AB 1
    include("ueberpruefeAbsorptionskoeffizienten2x2.jl");
    include("ueberpruefeLGS.jl")
    include("ueberpruefeMatrixVektor2x2.jl");
    include("ueberpruefeEindeutigkeit2x2.jl");
    include("ueberpruefeMatrixVektora.jl");
    # AB 2  
    include("Dateneinlesen.jl");
    include("Startpunkte.jl");
    include("distance.jl");
    include("getij.jl");
    include("getwallpositions.jl");
    include("createStartingPositionsmein.jl");
    include("ueberpruefeStartpunkt.jl");
    include("ueberpruefeberechneteSchnittpunkte.jl");
    include("Schnittpunkte.jl");
    include("Pixelberechner.jl");
    include("almostequal.jl");
    include("ueberpruefePixelkanten.jl");
    include("ueberpruefePara.jl");
    include("berechneallgemeineSchnittpunkte.jl");
    include("resize.jl");
    include("sortieren.jl");
    include("finde.jl");
    include("ueberpruefeaundb.jl");
    include("ueberpruefeZeile.jl");
    include("ueberpruefePixel.jl");
    include("Pixelberechner.jl");
    include("ueberpruefeAbstand.jl");
    include("ueberpruefeMittelpunkte.jl");
    include("bestimmePixelnummer.jl");
    include("ueberpruefePixelStrahl.jl");
    include("erstelleMatrix.jl");
    include("ueberpruefeSatzvervollstaendigung1.jl");
    include("ueberpruefeLaengeStrahl.jl");
    include("ueberpruefeLaengePixel.jl");
    include("ueberpruefeMatrix.jl")
    # AB 3
    include("ueberpruefeeindeutigeLoesung2x2.jl")
    include("ueberpruefeeindeutigeLoesung3x2.jl")
    include("ueberpruefekeineLoesung.jl")
    include("ueberpruefenormalenVektor.jl")
    include("ueberpruefeParameter.jl")
    include("ueberpruefeSatzvervollstaendigung2.jl")
    include("ueberpruefenaechsterPunkt.jl")
    include("echteCTDaten.jl");
    include("findenaechstesBild.jl")
    include("Bilderrekonstruktion.jl")
    include("createStartingPositionsmein2.jl")
    include("distance2.jl")
    include("getij2.jl")
    include("getwallpositions2.jl")
    include("erstelleA.jl")
    include("genTikhonov.jl")
    # Zusatz AB 3
    include("ueberpruefeFormel.jl");
    include("createStartingPositionsmeinsneu.jl");
    include("MartinStrahlen.jl");
    include("ueberpruefeSatzvervollstaendigung.jl");
    include("ueberpruefeneueFormel.jl");
    include("ueberpruefeAbleitung.jl");
    include("ueberpruefef_nah.jl");
    include("ueberpruefeerror.jl");
    include("erzeugeFehlerbehafteteDaten.jl");
    include("ueberpruefeSchuld.jl");
    include("ueberpruefep.jl");
    include("ueberpruefef_nahfehler.jl")
    include("ueberpruefef_nahfehler.jl")
end