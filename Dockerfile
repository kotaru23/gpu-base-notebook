FROM kotaru/python-gpu
MAINTAINER kotaru23

# 欲しいライブラリをインストール
RUN pip3 --no-cache-dir install --upgrade pip && \
    pip3 --no-cache-dir install \
        jupyter \ 
        jupyter_contrib_nbextensions \
        graphviz \
        rise

# Jupyter NotebookのExtensionの設定
RUN jupyter contrib nbextension install --user && \
    : "Jupyter Notebookでプレゼンをするためのライブラリ" && \
    jupyter-nbextension install rise --py --sys-prefix && \
    jupyter-nbextension enable rise --py --sys-prefix && \
    : "セルごとに実行時間を測定" && \
    jupyter-nbextension enable execute_time/ExecuteTime  && \
    jupyter nbextension enable code_prettify/code_prettify && \

WORKDIR /notebooks
EXPOSE 8888
ENTRYPOINT ["jupyter", "notebook", "--no-browser", "--ip=0.0.0.0", "--allow-root"]
