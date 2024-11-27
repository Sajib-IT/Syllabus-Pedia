class AppString {
  static const String serverError =
      'There could be a problem either with the network or during the server request. Please try again.';
  static const String selectionAlert = "Please select any meaningful portion.";

  static List<List<String>> allCourseNameList(String semesterName) {
    return [
      if (semesterName == "First Year First Semester")
        [
          "Basic Electrical Circuit",
          "Computer Programming",
          "Physics",
          "Mathematics-I (Differential and Integral Calculus)",
          "Technical Communicative English",
        ],
      if (semesterName == "First Year Second Semester")
        [
          "Electronic Devices and Circuit Theory",
          "Programming with C++",
          "Data Structure",
          "Discrete Mathematics",
          "Matrices and Co-ordinate Geometry",
        ],
      if (semesterName == "Second Year First Semester")
        [
          "Operational Amplifier and Timer Circuits",
          "Digital Logic Design",
          "Object Oriented Programming with Java",
          "Algorithm Design and Analysis",
          "Differential Equation and Vector Calculus",
          "Statistics"
        ],
      if (semesterName == "Second Year Second Semester")
        [
          "Computer Organization and Architecture",
          "Computer Based Numerical Methods",
          "Advanced Java and Mobile Application",
          "Database Management Systems",
          "Complex Variables and Fourier Analysis",
          "Economics",
          "Financial and Managerial Accounting"
        ],
      if (semesterName == "Third Year First Semester")
        [
          "Data Mining",
          "Analog and Digital Communication",
          "Microprocessor and Assembly Language",
          "Theory of Computation",
          "Operating Systems",
        ],
      if (semesterName == "Third Year Second Semester")
        [
          "Microwave Engineering",
          "Compiler Design",
          "Computer Peripheral and Interfacing",
          "Computer Networks",
          "Software Engineering",
          "Bio-Informatics"
        ],
      if (semesterName == "Fourth Year First Semester")
        [
          "Research Thesis/Project",
          "Telecommunication Engineering",
          "Simulation and Modeling",
          "Cryptography and Cyber Law",
          "E-Commerce and Web Programming",
          "Research Methodology"
        ],
      if (semesterName == "Fourth Year Second Semester")
        [
          "Research Thesis/Project",
          "Wireless and Mobile Communication",
          "Optical Communication",
          "Digital Signal Processing",
          "Artificial Intelligence"
        ]
    ];
  }

  static List<Map<String, String>> allCourseContentDetailsList(
      String courseName) {
    return [
      if (courseName == "Basic Electrical Circuit")
        {
          "Network Circuit and Analysis":
              "Fundamental electric concepts and measuring units, D.C. voltage, D.C Current, Resistance and power, dependent and independent sources, Series, Parallel, Series-Parallel circuits, Open and short circuits, Star-Delta conversion.",
          "Networks Theorems":
              "Superposition theorem, Thevenins theorem, Norton’s theorem, Maximum Power Transfer theorem, Millman’s theorem.",
          "Basic Passive Elements":
              "Resistor, Capacitor and Inductors in series and parallel, Transient in capacitive network, charging phase and discharging phase, RLC circuits.",
          "Magnetic Circuits":
              "Introduction to magnetic circuits, Solution of magnetic circuits, Hysteresis and eddy current losses.",
          "Fundamental of AC and the Basic Elements and Phasor":
              "Generation of the ac voltage and current; The sine wave; General format of sinusoidal voltage and currents; Phase and Algebraic representation of sinusoids; Average and RMS value; Frequency Response of the Basic elements; Average Power and Power factor; Complex Numbers: Rectangular and Polar form; Series and Parallel ac circuits; Series-Parallel ac circuits.",
          "Resonance":
              "Series and Parallel resonant circuit, Selectivity, Quality Factor"
        },
      if (courseName == "Computer Programming")
        {
          "Introduction":
              "Definition of Software, its classification, Problem solving steps, Introduction of C and its structure, history and Characteristics, Introduction to keywords, constants and identifiers, Fundamental of C variable and data types, Rules of constants, Introduction to arithmetic, relational and logical operators, Introduction to expressions, Managing data input, Managing data output.",
          "Control Statements":
              "Decision making and branching. If and if…else statements, Other control statements, switch and the ‘?:’ operator, Decision making and looping. While looping, Do…while and for looping statements, Jump statement goto, break and continue.",
          "Array":
              "Introduction to arrays. One-dimensional array. Some sample programs, Two-dimensional array. Some sample programs, String handling in C and some examples.",
          "String":
              "Introduction to character Arrays and String, Declaring and Initializing String variables, Reading Strings from Terminal, Writing String to Screen, Putting String Together, Comparison of Two Strings, String Handling Functions, Table of Strings.",
          "Function":
              "Need for multifunction programs, Definition of Function, return values, types and some examples, Function Calls, Function Declaration, Calling functions and arguments, Nesting of Function, Recursions, passing arrays to functions, Passing string to function, The Scope, Visibility and Lifetime of Variables, Storage class."
        },
      if (courseName == "Physics")
        {
          "Introduction to Solids":
              "Solids, Crystalline Solids, Amorphous Solids, Crystal lattice, Basis, Unit cell, Lattice Parameters, Single Crystals, Polycrystals, Energy Bands in Solids.",
          "Semiconductors":
              "Charge Carriers in Semiconductors, Intrinsic and Extrinsic Semiconductors, Doping, N-type and P-type semiconductors, Electron and Hole Concentrations in Intrinsic Semiconductor in Thermal Equilibrium, Fermi Levels in N-type and P-type Extrinsic Semiconductors, Electrical Conductivity, Diffusion Current.",
          "Wave and Oscillation":
              "Simple harmonic motion, Combination of S.H.M. and Lissajous figures, Damped Oscillations, Forced Oscillations, and Resonance. Traveling waves, the principle of superposition, Wave velocity, Group velocity and phase velocity, Power and intensity in wave motion, Interference of waves, Diffraction of waves, Standing waves. Audible, Ultrasonic, Infrasonic and Supersonic waves; Propagation and speed of longitudinal waves, Traveling longitudinal waves, Standing longitudinal waves, Beats, The Doppler effect.",
          "Electricity & Magnetisms":
              "Electronics: Charge & Matter, Column’s Law, The Electric Field, The electric field strength, Line of force, A dipole in an electric field, Gauss’s Law, Gauss’s law and Coulomb’s law, Electrical Potential, Capacitance & Resistance, Ohmic& non Ohmic material. Electromagnetism: Magnetic fields, Magnetic Force on a current, The Hall effect.",
          "Physical Optics":
              "Theories of light; Hyugen's principle and construction. Interference of light; Young's double slit experiment, Fresnel bi-prism, Newton's ring, interferometers. Diffraction of light; Fresnel and Fraunhoffer diffraction, diffraction by single and double slit diffraction gratings. Polarization, production and analysis of polarized light, optical activity, optics of crystals, optical guiding properties in details."
        },
      if (courseName == "Mathematics-I (Differential and Integral Calculus)")
        {
          "Differential Calculus":
              "Limits, continuity and differentiability; Successive differentiation of various types of functions; Leibniz’s Theorem; Rolle’s Theorem; Mean value Theorem in finite and infinite forms; Lagrange’s form of remainders; Cauchy’s form of remainder; Expansion of functions; Evaluation of indeterminate forms by L’Hospital’s rule; Partial differentiation; Euler’s Theorem; Tangent and Normal, Subtangent and subnormal in cartesian and polar co-ordinates; Maximum and minimum values of functions of single variable; Points of inflexion; Curvature, radius of curvature, center of curvature; Asymptotes, curve tracing.",
          "Integral Calculus":
              "Definitions of integration; Integration by the method of substitutions; Integration by parts; Standard integrals; Integration by the method of successive reduction; Definite integrals and its properties and use in summing series; Walli’s formula, Improper integrals, Beta function and Gamma function; Area under a plane curve in cartesian and polar co-ordinates; Area of the region enclosed by two curves in cartesian and polar co-ordinates; Trapezoidal rule, Simpson’s rule. Arc lengths of curves in cartesian and polar co-ordinates, parametric and pedal equations; Intrinsic equation; Volume of solids of revolution; Volume of hollow solids of revolution by shell method. Area of surface of revolution; Jacobian, multiple integrals and their application."
        },
      if (courseName == "Technical Communicative English")
        {
          "Grammar":
              "Grammatical principles, modals, phrases & idioms, prefixes & suffixes, sentence structures, wh & yes/no questions, conditional sentences.",
          "Vocabulary": "Technical & Scientific Vocabulary, defining terms.",
          "Spoken English":
              "Introduction to phonetic symbols, dialogue, responding to particular situations, extempore speech.",
          "Reading":
              "Comprehension of technical & non-technical materials skimming, scanning, inferring & responding to context.",
          "Technical Writing":
              "Paragraph & composition writing on scientific & other themes, report writing, research paper writing, library references.",
          "Professional communication":
              "Business letter, job application, memos, quotations, tender notice."
        },
      if (courseName == "Electronic Devices and Circuit Theory")
        {
          "Theory of semiconductor":
              "Energy band diagram of conductor, insulator and semiconductor, intrinsic and extrinsic semiconductor, effects of temperature on extrinsic semiconductors, Drift, Diffusion and other carrier theory.",
          "Semiconductors diodes":
              "Theory of p-n junction as diode, Junction diode characteristics and applications, Zener diodes and its application, Schottky Barrier Diodes, Varactor Diodes, Photo Diodes, Tunnel diodes, PIN diode, LCD, Half wave and full wave rectification with filtering and voltage regulators and power supply design.",
          "Bipolar Junction Transistor (BJT)":
              "PNP and NPN transistors, principles of operation, biasing and thermal stability, characteristics in different configurations, small signal analysis, BJT amplifiers, -model, T-model, transistor switching time, equivalent circuits using transconductance parameter for low, medium and high frequency operation of BJT.",
          "Field Effect Transistor (FET)":
              "Construction of JFET and MOSFET, characteristics and principles of operation, FET biasing, small signal analysis, introduction to CMOS and its application. Application of FETs as amplifier and switches, load line analysis, equivalent circuits using transconductance parameter for low, medium and high frequency operation of FETs, Ebers-Moll model view; design and analysis of single/multistage amplifiers, power amplifiers, differential amplifiers.",
          "Industrial Semiconductor Device":
              "Structure and basic operation of LED, SCR, UJT, DIAC, TRIAC, photo diodes, phototransistor, solar cells, Concept on vacuum devices."
        },
      if (courseName == "Programming with C++")
        {
          "Introduction":
              "Structure (Definition of Structure, Union, Structure union applications, Declaring Structure Variables, Accessing Structures Members, Arrays within Structure, Self-referential Structure, Array of structure and some examples); Pointer (Understanding pointers, Pointers and arrays, Pointers and functions, pointers and structures, Some special features of C (Macros, Enumerations), Bitwise operations); File management (File management concept in C, Defining, opening and closing a file, Input/output operations in file, Error handling and command line arguments, Introduction to graphics, Drawing some geometric objects).",
          "Basic of OOP":
              "Introduction to C++ , the origin of C++, Basic structure of C++ programs, Variables, constants, operators and expressions, data types, Program control statements, recursion, Arrays and strings, pointers, Advanced data types, access modifiers, pointer to function, dynamic memory allocation, User defined data types, advanced operators.",
          "Object oriented programming":
              "Concepts of object oriented programming, objects, polymorphism, inheritance, OPP with C++, Classes, parameterized constructors, friend functions, multiple inheritance, passing object to functions, arrays of objects, pointer to objects. Function and operator overloading, overloading constructor functions, references, Inheritance, virtual functions and polymorphism, C++’s I/O class library, C++ streams, creating insertors and extractors, formatting I/O, file I/O, Dynamic allocation using new and delete, Static class members, C++’s complex and BCD classes, the message based philosophy, using C++’s memory model, Using VROOMM overlay technology, Using command line compiler, compiling multiple file program."
        },
      if (courseName == "Data Structure")
        {
          "Introduction": "Concept of data types, abstract data types.",
          "Array":
              "Insertion, Deletion, Matrix representation of arrays, Multidimensional arrays, Pointers arrays, Record structures, Representation of records in memory; parallel arrays. Sparse matrices. Usefulness of sparse matrices.",
          "Stack and Queue":
              "Push and Pop operations. Arithmetic expression: polish notation implementation using stack Queue: Insert and Delete operations. Double ended queue, Priority queue.",
          "Recursion":
              "Direct and indirect recursion, Simulation of recursion, Depth of recursion, Removal of recursion. Towers of Hanoi using recursion.",
          "Linked lists":
              "One way and two way linked lists. Traversing, Searching, Insertion and Deletion operations. Concept of algorithm analysis.",
          "Sorting and Searching":
              "Bubble sort, Quick sort Merge sort, Selection sort, Inserting sort, Radix sort, Shell sort, linear searching, binary searching.",
          "Tree":
              "Binary Trees, Binary Search Trees: Traversing (inorder, preorder, postorder). Insertion and deletion operations in Binary search trees. Threaded Binary Tree, Application of trees. Set representation, decision trees, game trees and counting binary trees. B-tree and basic operations on B-tree. Binomial tree and binomial heap, operation on binomial heaps. Fibonacci heaps and operations. Heap sort. Huffman codes and compression algorithm. Disjoint set and operations and disjoint set forests.",
          "Graphs":
              "Graph representation, Adjacency matrix, Path matrix, Linked representation. Shortest paths: Warshall's algorithm. Operations on graphs, traversing a graph, Spanning trees.",
          "Symbol tables": "Static and dynamic tree tables.",
          "Hashing":
              "Hash function and overflow handling, Open hashing (Separate chaining), Close hashing (Open addressing), Linear probing, Quadratic probing, Double hashing."
        },
      if (courseName == "Discrete Mathematics")
        {
          "Introduction":
              "Set theory-Set operation, Representation of Sets, Algebraic Properties of set, computer representation of set, Logic-Prepositional Calculus, Logic and bit operation, Predicate and quantifier, Translating sentence into logical expressions.",
          "Function":
              "Introduction of function, some important function, Properties of function, Sequence and summation.",
          "Relation":
              "Representation of Relation, Properties of Relation, Some important Relations, Closures of relation.",
          "Number Theory":
              "Fundamental Theorem of Arithmetic, Modular Arithmetic; GCD, LCM, Prime Number, Congruence, Application of Congruence, Linear Congruence, Application of Number Theory, Mathematical Induction, Methods of Proof, First and Second principle of Mathematical induction.",
          "Counting Principle":
              "Basic Counting principle, Inclusion-Exclusion principle, Application of Sum rule and Product rule, Pigeon hole principle, Permutation Combination, Binomial Theorem.",
          "Definition of Graph":
              "Types of graphs, Representation of graph, Euler and Hamilton path, circuit, necessary and sufficient conditions.",
          "Graph coloring":
              "Isomorphism of graph, Tree- Comparison of tree and Graph, Spanning tree, algorithm of several trees, Application of trees, Tree Traversal, Trees and sorting."
        },
      if (courseName == "Matrices and Co-ordinate Geometry")
        {
          "Matrices":
              "Definition of matrix; Different types of matrices; Algebra of matrices; Adjoint and inverse of a matrix; Elementary transformations of matrices; Determinants: Matrix polynomials; Calay-Hamilton theory with uses of rank and nullity; Normal and canonical forms; Solution of linear equations; Eigenvalues and eigenvectors.",
          "Co-ordinate Geometry":
              "Transformation of co-ordinates axes and its uses; Equation of conics and its reduction to standard forms; Pair of straight lines; Homogeneous equations of second degree; Angle between a pair of straight lines; Pair of lines joining the origin to the point of intersection of two given curves, circles; System of circles; Orthogonal circles; Radical axis, radical center, properties of radical axes; Coaxial circles and limiting points; Equations of parabola, ellipse and hyperbola in Cartesian and polar co-ordinates.",
          "Co-ordinate Geometry of three dimensions":
              "System of co-ordinates, Distance of two points, Section formula, Projections, Directiones cosines, Equation’s of planes and Lines."
        },
      if (courseName == "Wireless and Mobile Communication")
        {
          "History and Evolution of Mobile Radio Communication":
              "Principle of Conventional Mobile Radio System, Limitation of Conventional Mobile Radio System",
          "Radio Paging":
              "Introduction, Paging Receiver Types, On Site Paging, Transmitter Specifications, Wide Area Paging, Transmission Specifications, Paging Receivers Architecture",
          "History and Evolution of Mobile Radio Communications":
              "Principle of Conventional Mobile Radio System, Limitation of Conventional Mobile Radio System",
          "Radio Pagings":
              "Introduction, Paging Receiver Types, On Site Paging, Transmitter Specifications, Wide Area Paging, Transmission Specifications, Paging Receivers Architecture",
          "History and Evolution of Mobile Radio Communicationa":
              "Principle of Conventional Mobile Radio System, Limitation of Conventional Mobile Radio System",
          "Radio Paginga":
              "Introduction, Paging Receiver Types, On Site Paging, Transmitter Specifications, Wide Area Paging, Transmission Specifications, Paging Receivers Architecture",
          "History and Evolution of Mobile Radio Communicationd":
              "Principle of Conventional Mobile Radio System, Limitation of Conventional Mobile Radio System",
          "Radio Pagingd":
              "Introduction, Paging Receiver Types, On Site Paging, Transmitter Specifications, Wide Area Paging, Transmission Specifications, Paging Receivers Architecture",
        },
      if (courseName == "Optical Communication")
        {
          "Introduction":
              "Basic Optical Communication System, Advantages and application of optical fiber Communication systems",
        }
    ];
  }
}
