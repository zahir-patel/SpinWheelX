from flask import Flask, request, jsonify
import google.generativeai as genai
import os

app = Flask(__name__)

genai.configure(api_key=os.getenv('GEMINI_API_KEY', ''))

@app.route('/generate-labels', methods=['POST'])
def generate_labels():
    data = request.json
    theme = data.get('theme', 'fruits')
    count = data.get('count', 8)
    prompt = f"Give me {count} fun {theme} names for a spin wheel game. Return as a comma-separated list."
    try:
        model = genai.GenerativeModel('gemini-pro')
        response = model.generate_content(prompt)
        # Parse response
        labels = response.text.strip().replace('\n', '').split(',')
        labels = [label.strip() for label in labels if label.strip()]
        return jsonify({'labels': labels})
    except Exception as e:
        return jsonify({'error': str(e)}), 500

@app.route('/generate-images', methods=['POST'])
def generate_images():
    # Placeholder: Gemini image generation may not be available in all regions
    # Return dummy image URLs for now
    data = request.json
    count = data.get('count', 8)
    return jsonify({'imageUrls': [f'https://placehold.co/128x128?text=AI+{i+1}' for i in range(count)]})

if __name__ == '__main__':
    app.run(debug=True, port=5001) 