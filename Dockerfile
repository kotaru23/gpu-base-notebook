FROM kotaru/python-gpu
MAINTAINER kotaru23

RUN pip3 --no-cache-dir install --upgrade pip && \
    pip3 --no-cache-dir install \
        jupyter \ 
        jupyter_contrib_nbextensions

# Jupyter NotebookのExtensionの設定
RUN jupyter contrib nbextension install --user

WORKDIR /notebooks
EXPOSE 8888
ENTRYPOINT ["jupyter", "notebook", "--no-browser", "--ip=0.0.0.0", "--allow-root"]
