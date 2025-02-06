# Grammar-Based Parsing Techniques in SICStus Prolog
This project focuses on writing grammars for various parsing techniques in SICStus Prolog. Each parser demonstrates a different approach to syntactic analysis, using well-defined grammatical rules.

-  Grammar-Based Implementation – Each parser is based on a structured grammar.
-  Unambiguous & Controlled Ambiguity – The grammar is unambiguous for some parsers, while for others, it allows only two possible variations.
-  Console Output – Displays parsing results in the terminal.
-  Document Output – Saves results to a file for further analysis.
-  Execution Time Measurement – Runs the parser 1000 times to measure performance.

#  Overview of Parsers
## 1️ Top-Down Parser (1.dcg-td.pl)
- Implements a top-down parsing strategy using Definite Clause Grammars (DCG).
- Parses sentences by recursively expanding non-terminals based on predefined grammar rules.
- Supports:
  - testp(P, A) – Console Output
  - test_doc – Document Output
  - test_time – Measures execution time for 1000 runs
## 2️ Left-Corner Parser (2.left-corner.pl, 2.left-corner-wf.pl)
- Uses a left-corner parsing strategy, which balances top-down prediction and bottom-up parsing.
- The 2.left-corner-wf.pl variant includes well-formed substring tables for improved efficiency.
- Supports:
  - testp(P, A) – Console Output
  - test_doc – Document Output
  - test_time – Measures execution time for 1000 runs
## 3️ Chart Parsers (Top-Down & Bottom-Up)
- 3.chart-td.pl: Implements a top-down chart parser, leveraging active charts to guide parsing.
- 3.chart-bu.pl: Implements a bottom-up chart parser, constructing parses incrementally from lexical items.
- Both parsers support:
  - testp(P, A) – Console Output
  - test_doc – Document Output
  - test_time – Measures execution time for 1000 runs
## 4️ Deductive Parsing (4.infer.pl)
- Implements a deductive parser, allowing the selection of different parsing strategies based on inference rules.
- Uses different inference-based parsers, which can be selected by enabling the corresponding ensure_loaded directive.
- Supported parsing strategies include:
  - CYK Parser (enabled by default):
```
:- ensure_loaded('4.parse-ded/inf-cyk.pl').
```
  - Other available parsing strategies (commented out but can be enabled):
```
%:- ensure_loaded('4.parse-ded/inf-top-.pl').
%:- ensure_loaded('4.parse-ded/inf-bott.pl').
%:- ensure_loaded('4.parse-ded/inf-earley.pl').
%:- ensure_loaded('4.parse-ded/inf2-earley.pl').
%:- ensure_loaded('4.parse-ded/inf-ccg.pl').
%:- ensure_loaded('4.parse-ded/inf-kay-td.pl').
%:- ensure_loaded('4.parse-ded/inf-kay-bu.pl').
%:- ensure_loaded('4.parse-ded/inf-kay-tdbu.pl').
```
- Supports:
  - exe – Console Output (parses sentences using the selected inference-based parser).

#  Files Structure
-  1.dcg-td.pl      # Top-Down Parser (DCG-based)
-  2.left-corner.pl  # Left-Corner Parser
-  2.left-corner-wf.pl  # Left-Corner with Well-Formed Substring Tables
-  3.chart-td.pl     # Top-Down Chart Parser
-  3.chart-bu.pl     # Bottom-Up Chart Parser
-  4.infer.pl        # Deductive Parser (supports multiple inference-based parsing strategies)
-  Text.txt          # Sample test sentences and POS annotations

#  How to Run
- Install SICStus Prolog.
- Load a parser in the SICStus REPL:
```
?- consult('1.dcg-td.pl').
```
- Run test queries (example for the top-down parser):
```
?- testp(P, A).      % Console Output
?- test_doc.         % Save output to a document
?- test_time.        % Measure execution time (1000 runs)
```
- Run the deductive parser (4.infer.pl with G-DCG.PL):
```
?- consult('4.infer.pl').
?- exe.  % Parses predefined text
```
- Enable a different inference-based parser (optional):
  - Open 4.infer.pl
  - Uncomment the desired ensure_loaded/1 line
  - Restart SICStus and reload the file

#  Notes
- This project is focused on grammar-based parsing rather than just implementation.
- Some implementations rely on SICStus Prolog libraries (e.g., lists, terms).
- 4.infer.pl depends on G-DCG.PL and can be configured to use different inference-based parsers.
