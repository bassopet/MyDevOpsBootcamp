on:
  push:
    branches:
      - master
    paths:
      - 'lab_4/**'

name: Start Azure VMs

jobs:

  connect-to-azure:
    runs-on: ubuntu-latest
    steps:

    - name: Azure Login
      uses: azure/login@v1
      with:
        creds: ${{ secrets.AZURE_CREDENTIALS }}

    - name: Checkout Code
      uses: actions/checkout@v2

    - name: Azure CLI Script
      uses: azure/CLI@v1
      with:
        inlineScript: |
          chmod +x ./lab_1/start_vm.sh
          ./lab_4/start_vm.sh
