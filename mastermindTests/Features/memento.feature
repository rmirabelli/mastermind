Feature: Memento

    The memento feature implements an undo mechanism using the memento design pattern

    Scenario Outline: undo a single move
        Given the game has <number> guesses in its input
        When the user selects undo
        Then the game has <output> guesses in its input

        Examples:
            | number | output |
            | 4      | 3      |
            | 3      | 2      |

    Scenario: undo an entire row
        Given the game has four submitted rows and no guesses
        When the user selects undo
        Then the game has three submitted rows and six guesses