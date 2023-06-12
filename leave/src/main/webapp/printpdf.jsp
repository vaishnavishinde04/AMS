<!DOCTYPE html>
<html>
  <head>
    <title>Print HTML Content as PDF</title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.9.2/html2pdf.bundle.min.js"></script>
  </head>
  <body>
    <h1>Hello World!</h1>
    <p>This is some sample text.</p>
    <button onclick="printHTML()">Print</button>
    <script>
      function printHTML() {
    	  
    	  // Remove the print button from the DOM
          const printButton = document.querySelector("button");
          printButton.parentNode.removeChild(printButton);
    	  
        const element = document.querySelector("html");
        
        const opt = {
        	    filename: "my-document.pdf",
        	    margin: [0.5, 0.5, 0.5, 0.5], // optional
        	    image: { type: 'jpeg', quality: 0.98 }, // optional
        	    html2canvas: { scale: 2 }, // optional
        	    jsPDF: { unit: 'in', format: 'letter', orientation: 'portrait' } // optional
        	  };
        html2pdf().set(opt).from(element).save();
      }
    </script>
  </body>
</html>
