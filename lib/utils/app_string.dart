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
          "Fundamental of AC and the Basic Elements and Phaser":
              "Generation of the ac voltage and current, The sine wave, General format of sinusoidal voltage and currents, Phase and Algebraic representation of sinusoids, Average and RMS value, Frequency Response of the Basic elements, Average Power and Power factor, Complex Numbers: Rectangular and Polar form, Series and Parallel ac circuits, Series-Parallel ac circuits.",
          "Resonance":
              "Series and Parallel resonant circuit, Selectivity, Quality Factor"
        },
      if (courseName == "Computer Programming")
        {
          "Introduction":
              "Definition of Software, its classification, Problem solving steps, Introduction of C and its structure, history and Characteristics, Introduction to keywords, constants and identifiers, Fundamental of C variable and data types, Rules of constants, Introduction to arithmetic, relational and logical operators, Introduction to expressions, Managing data input, Managing data output.",
          "Control Statements":
              "Decision making and branching, If and if…else statements, Other control statements, switch and the ‘?:’ operator, Decision making and looping, While looping, Do…while and for looping statements, Jump statement goto, break and continue.",
          "Array":
              "Introduction to arrays, One-dimensional array, Some sample programs, Two-dimensional array, Some sample programs, String handling in C and some examples.",
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
              "Simple harmonic motion, Combination of S.H.M. and Lissajous figures, Damped Oscillations, Forced Oscillations, and Resonance. Traveling waves, the principle of superposition, Wave velocity, Group velocity and phase velocity, Power and intensity in wave motion, Interference of waves, Diffraction of waves, Standing waves. Audible, Ultrasonic, Infrasonic and Supersonic waves, Propagation and speed of longitudinal waves, Traveling longitudinal waves, Standing longitudinal waves, Beats, The Doppler effect.",
          "Electricity & Magnetisms":
              "Electronics: Charge & Matter, Column’s Law, The Electric Field, The electric field strength, Line of force, A dipole in an electric field, Gauss’s Law, Gauss’s law and Coulomb’s law, Electrical Potential, Capacitance & Resistance, Ohmic& non Ohmic material. Electromagnetism: Magnetic fields, Magnetic Force on a current, The Hall effect.",
          "Physical Optics":
              "Theories of light, Hyugen's principle and construction, Interference of light, Young's double slit experiment, Fresnel bi-prism, Newton's ring, interferometers. Diffraction of light, Fresnel and Fraunhoffer diffraction, diffraction by single and double slit diffraction gratings. Polarization, production and analysis of polarized light, optical activity, optics of crystals, optical guiding properties in details."
        },
      if (courseName == "Mathematics-I (Differential and Integral Calculus)")
        {
          "Differential Calculus":
              "Limits, continuity and differentiability, Successive differentiation of various types of functions, Leibniz’s Theorem, Rolle’s Theorem, Mean value Theorem in finite and infinite forms, Lagrange’s form of remainders, Cauchy’s form of remainder, Expansion of functions, Evaluation of indeterminate forms by L’Hospital’s rule, Partial differentiation, Euler’s Theorem, Tangent and Normal, Subtangent and subnormal in cartesian and polar co-ordinates, Maximum and minimum values of functions of single variable, Points of inflexion, Curvature, radius of curvature, center of curvature, Asymptotes, curve tracing.",
          "Integral Calculus":
              "Definitions of integration, Integration by the method of substitutions, Integration by parts, Standard integrals, Integration by the method of successive reduction, Definite integrals and its properties and use in summing series, Walli’s formula, Improper integrals, Beta function and Gamma function, Area under a plane curve in cartesian and polar co-ordinates, Area of the region enclosed by two curves in cartesian and polar co-ordinates, Trapezoidal rule, Simpson’s rule. Arc lengths of curves in cartesian and polar co-ordinates, parametric and pedal equations, Intrinsic equation, Volume of solids of revolution, Volume of hollow solids of revolution by shell method. Area of surface of revolution, Jacobian, multiple integrals and their application."
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
              "Construction of JFET and MOSFET, characteristics and principles of operation, FET biasing, small signal analysis, introduction to CMOS and its application, Application of FETs as amplifier and switches, load line analysis, equivalent circuits using transconductance parameter for low, medium and high frequency operation of FETs, Ebers-Moll model view, design and analysis of single/multistage amplifiers, power amplifiers, differential amplifiers.",
          "Industrial Semiconductor Device":
              "Structure and basic operation of LED, SCR, UJT, DIAC, TRIAC, photo diodes, phototransistor, solar cells, Concept on vacuum devices."
        },
      if (courseName == "Programming with C++")
        {
          "Introduction":
              "Structure (Definition of Structure, Union, Structure union applications, Declaring Structure Variables, Accessing Structures Members, Arrays within Structure, Self-referential Structure, Array of structure and some examples), Pointer (Understanding pointers, Pointers and arrays, Pointers and functions, pointers and structures, Some special features of C (Macros, Enumerations), Bitwise operations), File management (File management concept in C, Defining, opening and closing a file, Input/output operations in file, Error handling and command line arguments, Introduction to graphics, Drawing some geometric objects).",
          "Basic of OOP":
              "Introduction to C++ , the origin of C++, Basic structure of C++ programs, Variables, constants, operators and expressions, data types, Program control statements, recursion, Arrays and strings, pointers, Advanced data types, access modifiers, pointer to function, dynamic memory allocation, User defined data types, advanced operators.",
          "Object oriented programming":
              "Concepts of object oriented programming, objects, polymorphism, inheritance, OPP with C++, Classes, parameterized constructors, friend functions, multiple inheritance, passing object to functions, arrays of objects, pointer to objects. Function and operator overloading, overloading constructor functions, references, Inheritance, virtual functions and polymorphism, C++’s I/O class library, C++ streams, creating insertors and extractors, formatting I/O, file I/O, Dynamic allocation using new and delete, Static class members, C++’s complex and BCD classes, the message based philosophy, using C++’s memory model, Using VROOMM overlay technology, Using command line compiler, compiling multiple file program."
        },
      if (courseName == "Data Structure")
        {
          "Introduction": "Concept of data types, abstract data types.",
          "Array":
              "Insertion, Deletion, Matrix representation of arrays, Multidimensional arrays, Pointers arrays, Record structures, Representation of records in memory, parallel arrays. Sparse matrices. Usefulness of sparse matrices.",
          "Stack and Queue":
              "Push and Pop operations, Arithmetic expression: polish notation implementation using stack Queue: Insert and Delete operations. Double ended queue, Priority queue.",
          "Recursion":
              "Direct and indirect recursion, Simulation of recursion, Depth of recursion, Removal of recursion. Towers of Hanoi using recursion.",
          "Linked lists":
              "One way and two way linked lists, Traversing, Searching, Insertion and Deletion operations. Concept of algorithm analysis.",
          "Sorting and Searching":
              "Bubble sort, Quick sort Merge sort, Selection sort, Inserting sort, Radix sort, Shell sort, linear searching, binary searching.",
          "Tree":
              "Binary Trees, Binary Search Trees: Traversing (inorder, preorder, postorder), Insertion and deletion operations in Binary search trees. Threaded Binary Tree, Application of trees. Set representation, decision trees, game trees and counting binary trees. B-tree and basic operations on B-tree. Binomial tree and binomial heap, operation on binomial heaps. Fibonacci heaps and operations. Heap sort. Huffman codes and compression algorithm. Disjoint set and operations and disjoint set forests.",
          "Graphs":
              "Graph representation, Adjacency matrix, Path matrix, Linked representation, Shortest paths: Warshall's algorithm. Operations on graphs, traversing a graph, Spanning trees.",
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
              "Fundamental Theorem of Arithmetic, Modular Arithmetic, GCD, LCM, Prime Number, Congruence, Application of Congruence, Linear Congruence, Application of Number Theory, Mathematical Induction, Methods of Proof, First and Second principle of Mathematical induction.",
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
              "Definition of matrix, Different types of matrices, Algebra of matrices, Adjoint and inverse of a matrix, Elementary transformations of matrices, Determinants: Matrix polynomials, Calay-Hamilton theory with uses of rank and nullity, Normal and canonical forms, Solution of linear equations, Eigenvalues and eigenvectors.",
          "Co-ordinate Geometry":
              "Transformation of co-ordinates axes and its uses, Equation of conics and its reduction to standard forms, Pair of straight lines, Homogeneous equations of second degree, Angle between a pair of straight lines, Pair of lines joining the origin to the point of intersection of two given curves, circles, System of circles, Orthogonal circles, Radical axis, radical center, properties of radical axes, Coaxial circles and limiting points, Equations of parabola, ellipse and hyperbola in Cartesian and polar co-ordinates.",
          "Co-ordinate Geometry of three dimensions":
              "System of co-ordinates, Distance of two points, Section formula, Projections, Directiones cosines, Equation’s of planes and Lines."
        },
      if (courseName == "Operational Amplifier and Timer Circuits")
        {
          "Operational amplifiers and applications":
              "Linear application of op-amp, Feedback, gain, input and output impedances, Properties of an ideal Op-Amp, non-inverting and inverting amplifiers, integrator, differentiator, weighted summer and other applications of Op-Amp circuits, frequency response and bandwidth.",
          "Oscillators circuits and wave generators":
              "Phase shift oscillator, Wine Bridge, Crystal, Tune collector oscillators, Sinusoidal. Feedback, Comparators and Converters, Schmitt trigger.",
          "Active Filters":
              "Butterworth filters, Band-pass filters, Band Reject Filters, All pass Filters.",
          "Linear wave shaping":
              "Linear and non-linear wave shaping. Diode Wave Shaping Techniques, Clipping and Clamping circuits. Non-linear function circuits. Negative resistance switching, Voltage regulators, Pulse generation.",
          "Timing Circuits":
              "Bi-stable, monostable and astablemultivibrators, sweep and staircase generator, IC 555 and its application. Application of Op-Amp in timing circuits. VCO, PLL, blocking oscillators, practical op-amp ICs and advanced ICs."
        },
      if (courseName == "Digital Logic Design")
        {
          "Basic Logic Circuits":
              "Gates, Boolean Algebra, De Morgan’s Theorem, Half and Full Adders, Subtractor, Sum of products and Product of sums, Mapping technique, Karnaugh map, Minimization of Logic circuits.",
          "Combinational Circuits":
              "Encoders & Decoders, Comparator, Parity generator, ALU, Multiplexer, Demultiplexers.",
          "Silicon integrated Logic Families":
              "AND, OR, INVERTER, other logic families with TTL, TL, RTL, RCTL, TIL, ECL, IIL, SOS, FET, & CMOSTL families.",
          "Sequential Circuits":
              "S-R, M/S, JK, D and T Flip-flops and Latches, Registers and Counters, Asynchronous and Synchronous counters, Different types of Registers, Counter application: Frequency and Digital Clock.",
          "Memory Circuit & System":
              "Introduction to memories, SAM, ROM, Static and Dynamic RAM, Flash memories, Charge coupled device and magnetic bubble memories. A/D Converter, D/A Converter.",
          "Arithmetic of Computers":
              "Constructing an Arithmetic Logic Unit, Multiplication, Division, Floating Point.",
          "The Processor: Data path and Control":
              "Introduction, Building a Data path, A Simple Implementation Scheme, A Multicycle Implementation, Microprogramming: Simplifying Control Design."
        },
      if (courseName == "Object Oriented Programming with Java")
        {
          "JAVA":
              "Introduction to OOP, Data Types and Variables Operation and Expressions Features of Object Oriented Programming.",
          "Control Structures": "Decision Making, Looping, Branching.",
          "Arrays, String Vectors":
              "Java Methods, Concept of classes and objects, Encapsulation, Inheritance, Interfaces, Abstract Class and Multiple Inheritance, Polymorphism, Interfaces and Multiple Inheritance.",
          "API":
              "Overriding, Overloading, Packages, Generics, Collections, Thread, Multithreading, Error and Exception Handling.",
          "Graphical User Interfaces":
              "Java Applets, Files and Streams, Java Database Connectivity (JDBC), Servlet, JSP."
        },
      if (courseName == "Algorithm Design and Analysis")
        {
          "Algorithm and Data structure":
              "Algorithm, Properties of good algorithm, Data Structure, Application Areas of Algorithm.",
          "Complexity Analysis of Algorithms":
              "Asymptotic Notations, Recurrences, Insertion Sort and its Complexity Analysis.",
          "Divide and Conquer approach & Heaps":
              "Divide and Conquer approach and Merge Sort, Algorithm of Merge Sort, Complexity Analysis Merge Sort, Quick Sort and its Algorithm, Complexity Analysis of Quick Sort, Heap Construction Algorithm, Heap sort, Application of Heap: Priority Queue.",
          "Dynamic Programming":
              "Algorithm of LCS, Dynamic Programming, Matrix Chain Multiplication Example, Algorithm of MCM, and Example of Longest Common Subsequence, Complexity Analysis.",
          "Greedy Algorithm":
              "Greedy Algorithm, Activity Selection Problem, Huffman Codes and it’s application, Knapsack problem, NP-Hard and NP-Complete Problems, Traveling Salesperson Problem, Complexity Analysis.",
          "Graphs basic & traversal techniques":
              "Representation of Graphs, Breadth First Search, Depth First Search, Algorithm of BFS and DFS, Minimum Spanning Tree, Kruskal and Prims Algorithm, Complexity Analysis.",
          "Shortest Path & Backtracking":
              "Single Source Shortest Paths, Dijkstra’s Algorithm, and Bellman-Ford Algorithm. All pair Shortest Path, Floyd Warshall Algorithm, Backtracking, n-Queen Problem, and Complexity Analysis, Branch and Bounds.",
          "Computational Geometry & Number Theory":
              "Computational Geometry, Line Segment Properties, Convex Hull, Graham Scan Algorithm of Convex Hull, Number Theory, GCD, Modular Arithmetic, Prime Number generation, Complexity Analysis."
        },
      if (courseName == "Differential Equation and Vector Calculus")
        {
          "Ordinary Differential Equation (ODE)":
              "Degree and order of ordinary differential equations, Formation of differential equations, Solution of first order differential equations by various methods, Solution of first order but higher degree ordinary differential equations, Solution of general linear equations of second and higher orders with constant coefficients, Solution of homogeneous linear equations and its applications, Solution of differential equations of higher order when dependent and independent variables are absent, Solution of differential equation by the method based on factorization of operators.",
          "Partial Differential Equations (PDE)":
              "Introduction. Linear and non-linear first order equations. Standard forms. Linear equations of higher order. Equations of the second order with variable coefficients. Wave equations. Particular solution with boundary and initial conditions.",
          "Series Solution":
              "Solution of differential equations in series by the method of Frobenius, Bessel’s functions, Legendre’s polynomials and their properties.",
          "Vector Algebra":
              "Scalars and vectors, equality of vectors, Addition and subtraction of vectors, Multiplication of vectors by scalars, Scalar and vector product of two vectors and their geometrical interpretation, Triple products and multiple products, Linear dependence and independence of vectors.",
          "Vector Calculus":
              "Differentiation and integration of vectors together with elementary applications, Definition of line, surface and volume integrals, Gradient, divergence and curl of point functions, various formulae, Gauss’s theorem, Stoke’s theorem, Green’s theorem."
        },
      if (courseName == "Statistics")
        {
          "Analysis of statistical data":
              "Location, Dispersion and their measures, Skewness, Kurtosis and their measures, Moment and Cumulants and Practical examples.",
          "Probability":
              "Concept of probability, Sample Space, Events union and Intersection of Events. Probability of events, Loss of probability, Conditional probabilities. Bose Einstein Statistics. Bay’s Theorem, Chebysec’s Inequality and Practical examples.",
          "Random variables and probability Distribution":
              "Basic concepts, Discrete and continuous random variables, Density and distributional functions, Mathematical expectation and variance, Joint marginal and conditional density functions. Conditional Expectation and conditional variance. Moments and Cumulant generating functions. Characteristic function. Study of Binomial Poisson, Normal and Bivariate Normal distribution and Practical examples.",
          "Linear Regression":
              "Correlation, Rank correlation. Partial and Multiple correlations Linear Regression for two Variables, Principle of Least Squares Method, Lines of best fit, Residual Analysis and examples.",
          "Test of Significance":
              "Basic ideas of Null hypothesis, Alternative hypothesis, Type-I error Type-II error level of significance Degree of freedom, Rejection region and Acceptance region. Test of Single mean, Single variance, Two sample means and Variances. Test for 2×2 contingency tables, Independence test and practical examples."
        },
      if (courseName == "Computer Organization and Architecture")
        {
          "Computer abstraction and technology":
              "Introduction, Below Your Program, Under the Covers, Integrated Circuits: Fueling, Innovation.",
          "The roll of performance":
              "Introduction, Measuring Performance, Relating the Metrics, Choosing Programs to, Evaluate Performance, Comparing and Summarizing Performance.",
          "Language of the Machine":
              "Introduction, Operations of the Computer Hardware, Operands of the Computer Hardware, Representing Instructions in the Computer, Instructions for Making Decisions, Supporting Procedures in Computer Hardware, Beyond Numbers, Other Styles of MIPS Addressing.",
          "Arithmetic of Computers":
              "Introduction, Signed and Unsigned Numbers, Addition and Subtraction, Logical Operations, Constructing an Arithmetic Logic Unit, Multiplication, Division, Floating Point.",
          "The Processor: Data path and Control":
              "Introduction, Building a Data path, A Simple Implementation Scheme, A Multicycle Implementation, Microprogramming: Simplifying Control Design.",
          "Enhancing performance with pipelining":
              "An Overview of Pipelining, A Pipelined Data path, Pipelined Control, Data Hazards and Forwarding, Data Hazards and Stalls, Branch Hazards.",
          "Multiprocessors":
              "Introduction, Programming Multiprocessors, Multiprocessors Connected by a Single Bus, and Multiprocessors Connected by a Network, Clusters, and Network Topologies.",
          "Memory Organization":
              "Introduction, Characteristics of memory systems, Main memory design, Memory hierarchy, Cache memory, Virtual memory and memory management concepts."
        },
      if (courseName == "Computer Based Numerical Methods")
        {
          "Introduction":
              "Significant figure, Rounding off numbers, Error in Numerical Calculation.",
          "Solution of Algebraic and Transcendental Equation":
              "Interpolation with equal and unequal intervals- Missing values, Newton’s binomial expansion formula, Newton’s forward and backward interpolation formula. Central difference interpolation formulae, inverse interpolation.",
          "Numerical Differentiation":
              "Derivate using Newton’s forward backward and Stirling’s formula.",
          "Numerical Integration":
              "General quadrature formula for equidistant ordinates. Trapezoidal rule, Simpson’s one-third rule, Simpson’s three-eight rules, Weddle’s rule.",
          "Numerical solution of ordinary differential equations":
              "Taylor’s series method, Euler’s method, Adams Bashforth Moulton method, Runge-Kutta method.",
          "Solution of linear equations":
              "Gauss-elimination method, Iteration methods. Gauss-Seidel method, Gauss-Jordan method.",
          "Curve Fitting":
              "Objective of fitting a curve, fitting a straight line, fitting a parabola."
        },
      if (courseName == "Advanced Java and Mobile Application")
        {
          "Java Database Connectivity":
              "JDBC Product, Types of Driver, Two tier Client/Server Model, Three tier Client/Server Model, Basic steps of JDBC, Creating and Executing SQL statement, The Result Set Object, Working with Database Meta Data, Interface.",
          "Servlets":
              "Servlet Interaction & Advance Servlet, Life Cycle of Servlets, Java Servlet Development Kit, Javax.servlet package, Reading Servlet parameter, Reading Initialization parameter.",
          "JavaServer Pages":
              "JSP Technologies, Understanding the Client Server Model, Understanding the Web Server Software, Configuring the JSP Server, Handling JSP Errors.",
          "Remote Method Invocation":
              "RMI Architecture, Designing RMI Application, Executing RMI Application.",
          "EJB":
              "Types of Enterprise Java Beans, Session Bean & Entity Bean, Features of Session Bean, Life Cycle of Stateful Session Bean.",
          "XML": "What is XML, XML Syntax Rules, XML Parsing.",
          "Struts":
              "Introduction to Apache Struts, MVC Architecture, Struts Architecture, How Struts Works, Introduction to Struts Controller, Introduction to Struts Action Class.",
          "Hibernate and Spring Framework":
              "Basic features of Hibernate and Spring Framework."
        },
      if (courseName == "Database Management Systems")
        {
          "Introduction":
              "Database, data, database management system, Database system versus file system, Data model, Database language, Database user administration, Database system structure, Storage manager, Overview of Physical storage medium.",
          "Entity-Relationship Model":
              "Entity sets, Relationship sets, Mapping Cardinalities, Keys, Attributes, Entity relationship diagram, Weak entity sets, Specialization, Generalization, Structure of Relational databases, Database Schema.",
          "The Relational Algebra and SQL":
              "Selection, projection, Union, Set difference, Cartesian-product, Rename, Set-intersection, Natural-join, Division, Assignment, projection, Aggregate functions.",
          "Integrity and Security and Relational Database Design":
              "Domain constraint, Integrity, Assertions, Triggers, Authorization, Authentication, Security, Privileges, Roles, Audit trails, Encryption-Decryption Algorithm.",
          "Database Design and E-R model":
              "The Entity Relationship Model, Constraints, Entity Relationship Diagram, Entity Relationship Design Issues.",
          "Storage and File Structure":
              "Physical Storage Media, Magnetic Disk, RAID, Storage Access, File Organization."
        },
      if (courseName == "Complex Variables and Fourier Analysis")
        {
          "Complex Variable":
              "Complex number system, General functions of a complex variable, Limits and continuity of a function of complex variable and related theorems, Complex differentiation and the Cauchy–Riemann Equations, Mapping by elementary functions.",
          "Fourier Analysis":
              "Fourier series, Convergence of Fourier Series, Fourier analysis, Fourier Integral, Fourier transforms and their uses in solving boundary value problems of wave equations.",
          "Laplace Transforms":
              "Definition, Laplace transforms of some elementary functions, Sufficient conditions for existence of Laplace transforms, Inverse Laplace transforms."
        },
      if (courseName == "Economics")
        {
          "Introduction":
              "Definition of economics, Scope and utility of studying economics.",
          "Micro-economics":
              "The theory of demand and supply and their elasticity, Price determination, Nature of an economic theory, applicability of economic theories to the problems of developing countries.",
          "Market":
              "Concepts of market and market structure. Cost analysis and cost function.",
          "Macroeconomics":
              "Savings, investment, employment, National income analysis, Inflation, Monetary policy, Fiscal policy and trade policy.",
          "Economics of development":
              "Dimensions of development, Relevance of theory, the employment problem.",
          "Economics of planning":
              "Planning and market, Policy models, Planning experience."
        },
      if (courseName == "Financial and Managerial Accounting")
        {
          "Preliminaries":
              "Introduction to Accounting, History and development of accounting thought, types of accounting, Accounting Principles & ethics, Accounting Equation & Transaction Analysis.",
          "Recording Business Transactions":
              "The Accounts & their types. Double-Entry Book keeping system, Invoice, discount from purchase price.",
          "The Adjusting & Closing Procedure":
              "The adjusting process, Accrual versus cash basis Accounting, Preparation of Adjusted trial balance and financial statements.",
          "Accounting in practice":
              "Worksheet. Purchase book, sales book, cashbook, patty cashbook.",
          "Cost In General":
              "Cost in general: objectives & classifications, Costing Journals, Job order costing, Process costing & Overhead costing.",
          "Marginal & Relevant costing":
              "Marginal costing tools and techniques, cost-volume-profit analysis. Guidelines for decision making."
        },
      if (courseName == "Data Mining")
        {
          "Data Mining":
              "Definitions, KDD (Knowledge Discovery Database) versus Data Mining, DBMS versus Data Mining, Data Mining Techniques, Issues and challenges, Applications of Data Warehousing & Data mining in Government.",
          "Association Rules":
              "A priori algorithm, Partition algorithm, Dynamic inset counting algorithm, FP-tree growth algorithm, Generalized association rule.",
          "Clustering Techniques":
              "Clustering paradigm, Partition algorithms, CLARA, CLARANS, Hierarchical clustering, DBSCAN, BIRCH, CURE, Categorical clustering, STIRR, ROCK, CACTUS.",
          "Decision Trees":
              "Tree construction principle, Best split, Splitting indices, Splitting criteria, Decision tree construction with presorting.",
          "Web Mining":
              "Web content Mining, Web structure Mining, Web usage Mining, Text Mining.",
          "Temporal and Spatial Data Mining":
              "Basic concepts of temporal data Mining, The GSP algorithm, SPADE, SPIRIT, WUM."
        },
      if (courseName == "Analog and Digital Communication")
        {
          "Radio Wave Propagation":
              "Surface and space wave propagation, Sky wave through Ionosphere. Pulse method for measuring height and electron concentration of Ionospheric region, Chapman theory of layer formation, Ionospheric storm.",
          "Modulation and Demodulation":
              "Linear modulation - AM, SSB, DSB, and SSB generation, PLL Circuit to generate linear modulated signals, low and high power modulators, Exponential modulation- FM and PM, demodulation of AM, FM.",
          "Broadcasting Transmitter":
              "Transmitter classification, Elements of transmitter, AM and FM transmitters, SSB transmitter, stabilized master oscillator, Frequency multipliers, Mixer circuits, RF power amplifier, Preemphasis circuits, Transmitter performance-carrier frequency requirements, audio frequency response, distortion, and signal to distortion ratio.",
          "Radio Receiver":
              "Receiver classification, Elements of receiver, AM and FM receivers, SSB receiver, Comparison of AM and FM receivers, Noise in receiver, AGC circuits, AFC circuits, Noise limiters, Receiver sensitivity, Cross modulation, Spurious responses.",
          "Representation of Random Signals and Noise in Communication System":
              "Signal Power and Spectral Representations, White noise, Thermal noise, PSDF of White Signals. Input and Output Relationship for Random Signals and Noise Passed Through a Linear Time Invariant System, Band Limited White Noise, ARC Filtering of White Noise.",
          "Noise performance of Analog Communication Systems":
              "Signal-to-Noise Ratio in Linear Modulation, Synchronous Detection of DSB. Signal-to-Noise Ratio for AM and SSB, FM, Effect of Noise in Envelope and Square Law Detection of AM, Threshold Effects in Nonlinear Detectors.",
          "Elements of Digital Communication Systems":
              "Model of Digital Communication Systems, Digital Representation of Analog Signal, Certain issues in Digital Transmission, Advantages of Digital Communication Systems, Bandwidth-S/N tradeoff, Hartley Shannon Law.",
          "Pulse Code Modulation":
              "PCM Generation and Reconstruction, Quantization noise, Non uniform Quantization and Companding, DPCM, Adaptive DPCM, DM and Adaptive DM. Noise in PCM and DM.",
          "Digital Modulation Techniques":
              "ASK, ASK Modulator, Coherent ASK Detector, Non-Coherent ASK Detector, FSK, Bandwidth and Frequency Spectrum of FSK. Non coherent FSK Detector, Coherent FSK Detector, FSK Detection Using PLL, BPSK, Coherent PSK Detection, QPSK, Differential PSK.",
          "Line Coding": "Techniques and Analysis."
        },
      if (courseName == "Microprocessor and Assembly Language")
        {
          "Introductory Concept":
              "Evaluation of microprocessor, Types of microprocessor, system bus, hardware of a microprocessor, memory-addressing technique.",
          "8086 Microprocessor":
              "Properties, architecture, registers, FLAGS register, physical address calculation, addressing modes, Instruction set, Instruction format, Fetch-decode-Execution cycle, interrupt, Types of interrupt, handling interrupt request, interrupt vector and table.",
          "Advanced Microprocessors":
              "Intel 80286 architecture, 80286-memory management, Protection, Intel 80386 functional diagram, 386 programming model, 80386 modes, Multi programming, 80486 and Pentium microprocessor.",
          "I/O operation":
              "Isolated and memory mapped I/O, DMA technique, I/O ports, I/O processor.",
          "Assembly Language":
              "Hardware of Microprocessor, Registers, assembler, Assembly language syntax, variables, Directives, Basic Instructions and their formats, The FLAG register, JMP, LOOP, CMP instructions, Conditional jump instruction, programming with high level structure.",
          "Logic instructions":
              "Logic instructions, Shift instructions, Rotate instruction, the stack and stack related instructions, Procedure and procedure related instructions, Multiplication and Division instructions-MUL, IMUL, DIV, IDIV, CBW, CWD, arrays, addressing modes, XLAT instructions.",
          "String instructions":
              "String instructions, Macro definition, Parameters in Macro, Macro directives, Nested macros, Interrupt, Interrupt vector and routine, Bios Interrupt, Dos Interrupt, The IN, OUT, INS and OUTS instructions."
        },
      if (courseName == "Theory of Computation")
        {
          "Finite automata":
              "Deterministic finite automata (DFA), Non-deterministic finite automata (NDFA), Equivalence and conversion of DFA and NDFA, Pushdown automata,",
          "Context free languages":
              "Context free grammars, push down automata, context free languages,",
          "Turing machines":
              "Basic machines, Configuration, Computing with Turing machines, Combining, Turing machines,"
        },
      if (courseName == "Operating Systems")
        {
          "Principle of operating systems and Operating system structure":
              "Definition of operating system, Different kinds of operating systems (Desktop, Multiprocessor, Distributed, Clustered, Real time, Hand held systems), Operating-System Services, User Operating-System Interface, System Calls, Types of System Calls, System Programs, Operating-System Design and Implementation, Operating-System Structure, Virtual Machines.",
          "Concurrency control, Recovery System and Distribute databases":
              "Lock-Based Protocols, Granting of locks, Two-phase locking protocol, Graph based protocol, Tree protocol, Timestamp based protocols, Deadlock detection and recovery. Failure classification, Storage types, Checkpoints. Distributed data, Replication and Fragmentation.",
          "Multiprocessing and time sharing, Process coordination, Deadlocks":
              "Multiple-Processor Scheduling, Thread Scheduling, Algorithm Evaluation, Deadlock Characterization, Methods for Handling Deadlocks, Deadlock Prevention, Deadlock Avoidance, Deadlock Detection, Recovery From Deadlock. Control and scheduling of large information processing systems, Resource allocation, Dispatching, Processor access methods, Job control languages.",
          "Memory Organization":
              "Introduction, Characteristics of memory systems, Main memory design, Memory hierarchy, Cache memory, Virtual memory and memory management concepts.",
          "Memory management":
              "Background, Swapping, Contiguous Memory Allocation, Paging, Structure of the Page Table, Segmentation, Demand Paging, Page Replacement, Thrashing, Demand Paging, Page Replacement.",
          "File systems":
              "File Concept, Access Methods, Directory Structure, File-System Mounting, File Sharing, File-System Implementation, Directory Implementation, Allocation Methods.",
          "Protection and security":
              "Protection, Principles of Protection, Domain of Protection, Access Matrix, Access Control, Revocation of Access Rights, The Security Problem, Program Threats, System and Network Threats, Cryptography as a Security Tool, User Authentication, Implementing Security Defenses, Fire walling to Protect Systems and Networks.",
          "Advanced topics":
              "Distributed operating system, distributed file system, synchronization, real time systems, multimedia operating system."
        },
      if (courseName == "Microwave Engineering")
        {
          "Microstrips": "Structures and characteristics.",
          "Rectangular Resonant Cavities":
              "Energy storage, losses. impedance transformer, filters, isolator.",
          "Microwave Devices":
              "Semiconductor Microwave devices, Transit time effect velocity Modulation, Microwave amplifier and oscillator, Klystron (Multicavity and reflex), Magnetron, TWT, other microwave tubes.",
          "Antennas":
              "Small current element, radiation resistance, radiation pattern and properties, Hertzian and half wave dipoles, Mono pole, horn, rhombic and parabolic reflector, array, and Yagi- Uda antenna.",
          "Radar and Electronic Navigation Systems":
              "Radar principles, Civil, military and weather applications, Radar equation, Transmitters and radiators, Factor influencing maximum range, Moving target indicator(MTI), Tracking Radar system and search systems, Electronic navigation systems, LORAN, ILS, SONAR.",
          "Modern Trends in Microwaves Engineering":
              "Effect of Microwaves on human body, Medical and Civil applications of microwaves, Electromagnetic interference / Electromagnetic Compatibility (EMI / EMC), Monolithic Microwave IC fabrication, RFMEMS for microwave components, Microwave Imaging."
        },
      if (courseName == "Compiler Design")
        {
          "Compiler Design Principles and Techniques":
              "Introduction, A simple syntax-directed translator, Lexical analysis, Syntax analysis, Syntax directed translation, Intermediate code generation, Run-time environments, Code generation, Machine-Independent optimizations, Instruction level parallelism, Optimizing for parallelism and locality, Interprocedural analysis, etc.",
          "Tools for Programming, Parser Generation, Debugging and Testing in Linux":
              "Programming tools: the GNU compiler tool chain, building software with GNU make, building and using libraries, coverage testing with GNU gcov, profiling with GNU gprof, building packages with automake/autoconf, etc., parser generation with flex and bison, Debugging and Testing: software unit testing frameworks, debugging with GDB, code hardening, etc."
        },
      if (courseName == "Computer Peripheral and Interfacing")
        {
          "Input devices":
              "Keyboard, Key switching mechanism and coding techniques, Static encoder, Lockout and rollover, Scanning encoder, Keyboard without key.",
          "Modern data-entry devices":
              "Scanners overview, Bar code reader, Optical mark reader (OMR), Optical Character Reader (OCR), Digitizer: Reading technique, Capacitive Electrostatic scanning digitizer.",
          "Display devices":
              "CRT, Basic CRT operations, Timing and frequencies, CRT controller ICs, LCDs, LCD technologies, Passive and active matrix, Guest-host techniques, Twisted-pneumatic LCDs, LCD reliability, Electroluminescent display.",
          "Printers":
              "Impact printers, Dot matrix printer, needle principal, Laser printing, Ink-Jet printing, Color printing, Plotters.",
          "Storage devices":
              "Floppy disk, Floppy disk controller, Position control with stepping actuators, Magnetic hard disk and controller, Compact disk.",
          "Introductory Concept of Interfacing":
              "I/O interface, memory interface, interfacing components and their characteristics.",
          "Serial and parallel Interface":
              "Characteristics of memory and I/O interface, Synchronous and asynchronous communication, Serial I/O interface, RS232, 8251A communication interface, RS-232 interface, 8155A Programmable peripheral Interface, Parallel adapter, parallel port.",
          "Interfacing components":
              "8284A Programmable timer, Bus architecture, Bus Timing, Bus Controller, analog and digital interface, Interrupt sources, types of interrupt, 8259A priority interrupt controller, Daisy chain.",
          "I/O Controller":
              "8237A DMA Controller, Floppy and Hard disk Controller.",
          "Embedded System":
              "Introduction to Embedded system, The Embedded Design Life Cycle, Models of Computation, State Charts, General language Characteristics (SDL, Petri nets, Message Sequence Charts, UML, JAVA, HDL), Embedded System Hardware, (Input, Communication, Processing Unit, Memories, output) Embedded operating systems, middleware & Scheduling, Implementing, ASIC, Embedded Systems Hardware/Software co-design."
        },
      if (courseName == "Computer Networks")
        {
          "Introduction":
              "Computer networks, Types of Computer networks, Network Topology, Circuit Switching and Packet Switching, protocol and protocol hierarchies, The OSI reference model, TCP/IP protocol suit.",
          "Physical Layer and Media":
              "Guided transmission media, wireless transmission, radio waves, microwaves, infrared, Bluetooth, satellites communication etc.",
          "The Network layer":
              "Network layer design issues: IP addressing, IP packet forwarding, Sub-netting, CIDR, Internet Protocol, ICMP, ARP, RARP, DHCP, and IPv6 overview, Address mapping, Error reporting and multicasting, Delivery, Forwarding, and Routing algorithms, Congestion control algorithms.",
          "The Transport layer":
              "The transport service, Elements of transport protocols, simple transport protocols, User datagram protocol (UDP) – UDP operations and UDP package modules, Transmission control protocol (TCP) – TCP features, TCP Connection establishment and termination, TCP Flow control and error control, Congestion control.",
          "The Application layer":
              "The Domain Name System, Electronic Mail, Network Management: SNMP, World Wide Web, HTTP, Multimedia etc.",
          "Multiplexing, Spreading and switching":
              "Multiplexing – FDM, WDM, TDM (Synchronous and statistical) spread spectrum FHSS & DSSS, Circuit Switching, Packet Switching, Message Switching, Routing Algorithms, Virtual Circuit and Datagram, Congestion Control Algorithms, Quality of Service, Internetworking, Internetworking Devices etc.",
          "Error-Recovery and Link-Control":
              "Data link layer and control, Error detection and correction, framing, flow and error control, Stop-and-Wait protocol, Automatic Repeat Request (ARQ), Go-Back-N, Selective Repeat, HDLC, PPP.",
          "Multiple Access":
              "Random Access, ALOHA, CSMA, CSMA/CD, CSMA/CA, Channelized Access, CDMA, TDMA, FDMA, Controlled Access, Reservation, Poling, Token Passing. Ethernet, Wireless LANs, and Bluetooth.",
          "Network Layer Protocols":
              "Address Resolution Protocol, Internet Protocol, Internet Control Message Protocol, IPV6, Routing Information Protocol, Open Shortest Path First, Border Gateway Protocol, User Datagram Protocol, Transmission Control Protocol."
        },
      if (courseName == "Software Engineering")
        {
          "Software Engineering Paradigms":
              "Definition of S/W Eng., The classical life cycle, prototyping fourth generation technique, The product and the process, measurement, matrices.",
          "Software Project Planning":
              "Project planning objectives, S/W slope, Resources, Metrics for S/W productivity and quality, S/W project estimation, Decomposition techniques, Empirical Estimation Models, Automated Estimation tools, S/W project scheduling.",
          "Requirements Analysis Fundamentals":
              "Analysis principle, Software Prototyping Specification, Requirement Analysis Methodologies, Structured and object oriented analysis, Data Flow-oriented Analysis methods.",
          "Software Design Fundamentals":
              "Design process, Design fundamentals: S/W architecture, program structure, Data structure, S/W procedure, Modularity, abstraction, Effective modular design, Procedural design, Data flow-oriented Design, Top-down and bottom-up design, Design Process considerations, Transform analysis, Transaction analysis, Data structure-oriented design: Logical construction of programs and systems, Data structured systems development, object-oriented design, Design concepts, Methods, strategy. Real-time Design, coding style: Code documentation, Data declaration, statement construction, Input/output.",
          "Software reliability and availability models":
              "Software quality factors, software review, software quality metrics, Software reliability, Software quality assurance approach.",
          "Software Testing Techniques":
              "Testing fundamentals, White box testing, Basis path testing, Loop testing, Black Box testing.",
          "Software Testing Strategies":
              "Verification and validation, Organization for software testing, Unit testing, Integration testing, Validation testing, System testing, The art of debugging.",
          "Software Maintenance and configuration management":
              "Definition, Maintenance Characteristics, Maintainability, Maintenance tasks, Software configuration management."
        },
      if (courseName == "Bio-Informatics")
        {
          "Introductory Concept":
              "Basics of Biology, Molecular Biology and Bioinformatics, The central Dogma, DNA, transcription, Translation, Genomics, Amino acids, Proteomics and Genomics, Human Computer Interaction and Bioinformatics.",
          "Genome Analysis and Gene Mapping":
              "Genome analysis, genome mapping, sequence Alignment, pair wise sequence alignment, Multiple sequence alignment, local and global alignment, sequence alignment techniques: dot matrix, dynamic algorithms, Popular algorithms: Needleman and Wunsch, Smith-Waterman, Scoring methods: PAM, BLOSUM, Phylogenetic analysis. Tools for similarity search, BLAST, Phi-BLAST, Psi-BLAST, FASTA.",
          "Classification and Analysis of Protein":
              "Overview of protein structure, protein structure Database, Data Capture, capturing micro array data, protein structure visualization tools, protein structure alignment, protein classification approaches, Alpha and beta structure analysis, structure comparison, protein structure analysis and prediction, motif, profiles, patterns and fingerprint search, protein evolution, Methods of 2D structure prediction, 2-D Gel Electrophoresis, 2-D Gel Electrophoresis image analysis, tools: CAROL, PiKA, Z3, PDQuest.",
          "Multiple sequence alignment, Functional annotation of sequences, Gene Identification and Prediction":
              "Gene Expression and Microarray, Hidden Markov Model, Navigation the NCBI web site. Genbank, EMBL, OMIM, Pubmed, Navigation other genome database sites (Ensembl, Celera).",
          "Bionic Arm":
              "Introduction of bionic devices, working principle of bionic arm, first bionic man and woman, prospect of bionic devices, latest bionic components."
        },
      if (courseName == "Telecommunication Engineering")
        {
          "Introduction":
              "Evolution of Telecommunications, Simple Telephone Communications, Basics of Switching System, Manual Switching System, Major Telecommunication Networks.",
          "Switching":
              "Circuit Switching, Packet Switching, Message Switching, Crossbar Switching, Routing Algorithms, Virtual Circuit and Datagram, Congestion Control Algorithms, Quality of Service, Quality of Experience, Internetworking, and Internetworking Devices etc.",
          "Telephone and Cable Network for Data Transmission":
              "Telephone network, Subscriber loop systems, Switching hierarchy and routing, Transmission plan, Transmission systems, Numbering plan, Charging plan, Signaling techniques, In channel signaling, Common channel signaling, Dial-up modem, cable telephone Network etc.",
          "Traffic Engineering":
              "Network traffic load and parameters, Grade of services and blocking probability, Modeling switching systems, Incoming traffic and service time characterization, Blocking models and loss estimates, Delay systems.",
          "Multimedia Communication":
              "Categories of Audio and Video Services, Digitizing Audio and Video, Audio and Video Compression, Streaming Stored Audio and Video, Streaming Live Audio and Video, Real-Time Interactive Audio and Video, Quality of Service, Quality of Experience, Internet Service Models, Best-Effort Service Model, Real-Time Transport Protocol, Real-Time Transport Control Protocol, Skype, Signaling for Voice over IP, Integrated Service Model, ReSerVation Protocol, differentiated Service Model, Content Distribution Networks.",
          "Satellite Communication":
              "Overview of Satellite System, Satellite communications: Satellite architecture, Satellite network segments, Operational frequency bands and characteristics, Multiple access techniques, VSAT, Emerging Applications and innovations in satellite, Global Positioning System (GPS)."
        },
      if (courseName == "Simulation and Modeling")
        {
          "Basic Simulation Modeling":
              "The Nature of Simulation Systems, Models, and Simulation Discrete-Event Simulation Simulation of a Single-Server Queueing Alternative Approaches to Modeling and Coding Simulations, Parallel and Distributed Simulation, Simulation across the Internet and Web-Based Simulation, Steps in a Sound Simulation Study, Other Types of Simulation: Continuous Simulation, Combined Discrete-Continuous Simulation.",
          "Modeling Complex Systems":
              "Introduction, List Processing in Simulation, Approaches to Storing Lists in a Computer Linked Storage Allocation, A Simple Simulation Language: simlib. Single-Server Queueing Simulation with simlib Time-Shared Computer Model Job-Shop Model Efficient Event-List Manipulation.",
          "Simulation Software":
              "Comparison of Simulation Packages with Programming Languages Classification of Simulation Software General-Purpose Simulation Packages Object-Oriented Simulation, Building Valid, Credible, and Appropriately Detailed Simulation Models Experimental Design, Sensitivity Analysis, and Optimization Simulation of Manufacturing Systems.",
          "Simulation":
              "Partial Differential Equations, Random Signals, Hybrid Simulation, Digital Simulation, Simulation Language-GPSS, SIMSCRIPT, CSMP, etc."
        },
      if (courseName == "Cryptography and Cyber Law")
        {
          "Introduction to Security":
              "Need for security, Security approaches, Principles of security, Types of attacks.",
          "Cryptographic Techniques":
              "Plaintext, Cipher text, Substitution & Transposition techniques, Encryption & Decryption, Types of attacks, Key range & Size.",
          "Symmetric & Asymmetric Key Cryptography":
              "Algorithm types & Modes, DES, IDEA, Differential & Linear Cryptanalysis, RSA, Symmetric & Asymmetric key together, Digital signature, Knapsack algorithm.",
          "User Authentication Mechanism":
              "Authentication basics, Passwords, Authentication tokens, Certificate-based & Biometric authentication, Firewall.",
          "Case Studies of Cryptography":
              "Daniel of service attacks, IP spoofing attacks, Secure inter-branch payment transactions.",
          "Cyber Law":
              "Digital copyrights issues, illegal duplication of software, human rights and data encryption, international cyber law, information sharing, cyber squatting.",
          "Basic Concepts of Technology and Law":
              "Understanding the Technology of Internet, Scope of Cyber Laws, Cyber Jurisprudence.",
          "Law of Digital Contracts":
              "The Essence of Digital Contracts, The System of Digital Signatures, The Role and Function of Certifying Authorities, The Science of Cryptography.",
          "Intellectual Property Issues in Cyber Space":
              "Domain Names and Related issues, Copyright in the Digital Media, Patents in the Cyber World.",
          "Rights of Netizens and E-Governance":
              "Privacy and Freedom Issues in the Cyber World, E-Governance, Cyber Crimes and Cyber Laws. Information Technology Act, International Scenario in Cyber Laws, Cyber Law Issues for Management, Security Perspective, Internet Security Issues, Digital Signatures for Securing Information Assets, Security Policies."
        },
      if (courseName == "E-Commerce and Web Programming")
        {
          "Internet Overview":
              "Intra- and Inter-networking, Internet, Internet architecture, Internet service providers (ISP), Tier architecture of the Internet, Internet core, Access networks (DSL, cable, Wireless etc.)",
          "Internet Applications":
              "Voice Over IP (VoIP), Video on Demand (VoD), IPTV, and other multimedia and real-time applications.",
          "Web Programming":
              "The web, web 2.0 and Ajax, browser basics, XHTML, cascading style sheets (CSS), JavaScript, dynamic HTML, XML, RSS, building Ajax-enabled web application, Macromedia Flash, Adobe ® Flex TM, Macromedia ® Dreamweaver ®, web servers (IIS and Apache), database: SQL, MySQL, DBI and ADO.NET 2.0, web services, PHP, ASP.NET, web forms and web controls, JavaServer Pages web applications, Perl and CGI (Common Gateway Interface), etc."
        },
      if (courseName == "Digital Image Processing")
        {
          "Introduction":
              "Introduction of Digital Image Processing and Pattern Recognition, Application areas, Fundamental steps of Digital Image Processing, Components of Digital Image Processing, Image & Video, Image & Human eyes, Color TV scheme.",
          "Analog and Digital Image":
              "Analog and Digital Image, Image Acquisition and acquisition devices, Spatial and amplitude quantization, Pixels, Resolution, Aspect Ratio, Gray levels, Relationship color and gray levels.",
          "Image Enhancement":
              "Different types of Image Enhancement operations, Spatial domain and frequency domain processing, Different types of filtering.",
          "Image Compression":
              "Fundamental concepts of Image Compression and Data Compression, Data Redundancy, Image Compression models, Error-free and Lossy compression, Image Compression Standards.",
          "Morphological Processing & Segmentation":
              "Image Segmentation, Different types of Segmentation, Edge linking and boundary detection, Thresholding, Region-oriented segmentation, Morphological Image Processing, Dilation, Erosion, Opening, Closing, Hit and Miss etc.",
          "Image Representation":
              "Object representation and description algorithms, Run Code, Chain Code, Signature, Skeleton, Boundary detection, Feature Extraction, few case studies.",
          "Pattern Recognition":
              "Fundamental concepts of Pattern Recognition, Pattern, Pattern Classes, Types of Pattern Recognition, Decision Theoretic methods, Structural method, Statistical method, Neural Network, Few case studies like speech recognition, fingerprint recognition, character recognition etc.",
          "Multimedia Applications":
              "Tele-Conferencing, Virtual Reality, Authoring Tools, Multimedia Documents, Games."
        },
      if (courseName == "Wireless and Mobile Communication")
        {
          "History and Evolution of Mobile Radio Communication":
              "Principle of Conventional Mobile Radio Systems, Limitations of Conventional Mobile Radio System.",
          "Radio Paging":
              "Introduction, Paging Receiver Types, On Site Paging, Transmitter Specifications, Wide Area Paging, Transmission Specifications, Paging Receivers Architecture.",
          "Cellular Radio Systems":
              "Basic Elements of a Cellular Radio System/Network, Principles of Operations, Frequency Spectrum and its Management, Radio Planning, Overview of Cellular Standard Systems, Digital Cellular Systems, Details of TACS and GDSM Architecture. 1G, 2G, 3G, 4G and the Forthcoming 5G Cellular Mobile Systems.",
          "Mobile Communications by Satellite":
              "Service Systems in Operation, INMARSAT, MSAT, LEO and MEO Satellite, GMPCS Mobile Telephone and Data Sensing System using LEO and MEO Satellites (Iridium, Teledesic).",
          "Introduction to Wireless Networks":
              "Wireless access networks – wireless mesh networks, personal area networks (wireless sensor networks, body area networks, LowPan, and Bluetooth), wireless and mobile ad hoc networks, challenged networks (DTNs, VANETs).",
          "Wireless MAC Protocols":
              "IEEE 802.11, IEEE 802.11e, IEEE 802.11n, IEEE 802.11s, IEEE 802.15.4, S-MAC, B-MAC, IEEE 802.22/20, IEEE 802.16d/e.",
          "Wireless Routing":
              "Routing matrix – ETX, ETT, WCETT, AirTime Metric, routing protocols – AODV, DSR, DSDV, HWMP, sensor network routing, VANET routing etc.",
          "Wireless Transport Protocols":
              "Wireless TCP and its variants, Hop by Hop Congestion Control, Rate based Congestion Control etc.",
          "Emerging Technologies":
              "Bluetooth, Radio Frequency Identification (RFID), Wireless Broadband (WiMAX), Mobile IP, Voice Over Internet Protocol (VOIP), Session Initiation Protocol (SIP)."
        },
      if (courseName == "Optical Communication")
        {
          "Introduction":
              "Basic Optical communication system, Advantages and application of optical fiber communication systems.",
          "Propagation in Dielectric Waveguides":
              "Slab waveguide, Modes in symmetric and asymmetric waveguide, Coupling to the waveguide, Dispersion and distortion in the slab waveguide, integrated optic component.",
          "Attenuation in Optical Fiber":
              "Introduction, attenuation, absorption, Rayleigh scattering, Pulse distortion and information rate.",
          "Optical Fiber and Fiber Cables":
              "Classification of fiber and fiber cables, step index fiber, graded index fiber, Description of modes and types of modes, Different type of modes, Numerical aperture and multipath dispersion in step-index and graded index fiber, Construction of fiber and fiber optic cable.",
          "Light Sources":
              "LED, LD, Optical amplifiers fiber laser, vertical cavity surface-emitting laser diodes.",
          "Light Detectors":
              "Photo detection, photomultiplier, semiconductor photodiode, PIN photo diode, Avalanche photodiode, and their comparison.",
          "Coupler and Connectors":
              "Connector principle, fiber end preparation, splices, connectors, source coupling, loss mechanism.",
          "Network Distribution and Fiber Components":
              "Direction coupler, star coupler, optical switches, wavelength converters, isolator, Attenuators, circulator, polarization, port configuration of coupler, fiber Bragg grating, Array wave guide gratings, diffraction gratings.",
          "Noise and Detection":
              "Thermal and shot noise’s, error rates, receiver circuit design, coherent optical fiber detection system, optic heterodyne receivers.",
          "System Design":
              "Analogue and digital system design, few practical problem and example, application of fiber optic communication in telecommunication.",
          "Optical Communication":
              "Optical Communication system with analog and digital modulation formats, performance and system budgets, Multi channel system, WDM."
        },
      if (courseName == "Digital Signal Processing")
        {
          "Discrete Fourier Transform":
              "Frequency-domain sampling, Discrete Fourier Transform (DFT), Properties of DFT, Linear filtering and frequency analysis of signals using DFT, Discrete Cosine Transform.",
          "Efficient Computation of DFT":
              "Fast Fourier Transform (FFT) algorithms, Applications of FFT algorithms, Linear filtering approach to the computation of DFT, Quantization effects in the computation of DFT.",
          "Digital Filters":
              "Causality, Symmetric and Antisymmetric Finite Impulse Response (FIR) filters, Linear-phase FIR filters, FIR differentiator, Hilbert transformer, Infinite Impulse Response (IIR) filter design methods, Frequency transformations.",
          "Multirate Signal Processing":
              "Decimation by a factor D, Interpolation by a factor I, Sampling rate conversion (SRC), Filter design for SRC: Direct Form FIR Digital Filter Structure, Cascade Form FIR Digital Filter Structure, Polyphase FIR Structure, Multistage Implementation of SRC, SRC of band pass signal, SRC by arbitrary factor, Multirate signal processing applications.",
          "Optimum Filters and Spectrum Estimation":
              "FIR Wiener Filter, IIR Wiener Filter, Discrete Kalman Filter, Nonparametric Methods: The Periodogram method, Bartlett’s method, Welch’s method, Blackman-Turkey method, Parametric Methods: Autocorrelation method, Co-variance method, Modified Co-variance method, Burg method, Frequency Estimations.",
          "Adaptive Filtering":
              "Introduction, FIR Adaptive Filters, Adaptive Recursive Filters, Recursive Least Squares: Exponentially Weighted RLS, Sliding window RLS (WRLS).",
          "Software Developments":
              "Assembly programs, C programs, mixing C and assembly code, software development tools.",
          "Hardware Issues":
              "Hardware selection, configurations, and hardware tools. System considerations. Introduction to code composer studio (CCS)."
        },
      if (courseName == "Artificial Intelligence")
        {
          "Concepts of Artificial Intelligence":
              "Introduction, The Foundations of AI, The History of AI, AI technique, The State of the Art.",
          "Problems and Problem Solving":
              "Problems, Example of Problems, Problem Formulation, Problem-solving methods.",
          "Various Searching Techniques":
              "Search Strategies, Uninformed (blind) search strategies like Breadth-First search, Uniform cost search, Depth-First Search etc. and Informed or Heuristic Search Strategies like Generate-and-test, Hill Climbing, Best-First Search, Problem Reduction, Constraint Satisfaction, Means-End Analysis etc.",
          "Propositional and First-Order Logic":
              "Knowledge Representation, Reasoning and Logic, Propositional Logic: Syntax, Semantics, Validity and Inference, Rules of Inference for Propositional logic, First-Order Logic: Syntax and Semantics, Using first-order logic.",
          "Inference in First-Order Logic":
              "Inference Rules Involving Quantifiers, Example Proof, Generalized Modus Ponens, Forward and Backward Chaining, Completeness, Resolution.",
          "Game Playing":
              "Introduction, Perfect Decisions, Imperfect Decisions, Alpha-Beta Pruning.",
          "Natural Language Processing":
              "Introduction, Syntactic Processing, Semantic Analysis, Discourse and Pragmatic Processing.",
          "Planning":
              "Basic Plan-Generating Systems, Forward Production System, Representation for Plans, Backward Production System, STRIPS, Examples with problem domain.",
          "Learning":
              "Introduction to Learning, Inductive Learning, Learning Decision Trees, Neural Net Learning.",
          "Probabilistic Reasoning":
              "Probability and Bayes’ Theorem, Certainty Factors and Rule-Based Systems, Bayesian Networks, Fuzzy Logic.",
          "Expert Systems":
              "Expert system architecture, Representation and Using Domain Knowledge, Expert System Shells, Explanation, Knowledge Acquisition."
        }
    ];
  }
}
