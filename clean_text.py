import sys
import re

def clean_text(text):
    # Remove all non-alphanumeric characters except spaces, newlines, and the specified punctuations: , . " :
    cleaned_text = re.sub(r'[^a-zA-Z0-9\s.,":]', '', text)
    
    # Replace multiple newlines with a single newline
    cleaned_text = re.sub(r'\n+', '\n', cleaned_text)
    
    # Replace two or more spaces with a single space
    cleaned_text = re.sub(r' {2,}', ' ', cleaned_text)
    
    return cleaned_text.strip()

if __name__ == "__main__":
    # Read input from stdin
    input_text = sys.stdin.read()

    # Clean the text
    cleaned_text = clean_text(input_text)

    # Output the cleaned text
    print(cleaned_text)
